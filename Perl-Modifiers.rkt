#lang scribble/lp


@section{Modifier Definitions}

The purpose is to generate a Racket symbol that is consistent with the symbol of its corresponding @code{perl}. These can then be manipulated at the higher levels of the program.

@chunk[<Perl-modifiers>
       <perl-modifiers-requires>
       <perl-modifiers-provide>
       (define modifier_m <modifier_m>)
       (define modifier_s <modifier_s>)
       (define modifier_i <modifier_i>)
       (define modifier_x <modifier_x>)
       (define modifier_p <modifier_p>)
       (define modifier_g <modifier_g>)
       (define modifier_c <modifier_c>)
       (define modifier_a <modifier_a>)
       (define modifier_d <modifier_d>)
       (define modifier_u <modifier_u>)
       (define modifier_l <modifier_l>)]

The perl-modifiers require the structures @code{lexp} and @code{perl} from @code{Lexp-structures.rkt}.

@chunk[<perl-modifiers-requires>
       (require "Lexp-structures.rkt")]

@chunk[<perl-modifiers-provide>
       (provide (all-defined-out))
       (provide
        (all-from-out "Lexp-structures.rkt"))]



@subsection{Basic Modifiers}

Perl-definitions from @link["http://perldoc.perl.org/perlre.html"]{perldoc: @emph{Perl regular expressions}} on 2013/12/15.


@chunk[<modifier_m>
(perl "treatStringAsMultipleLines"
      "m" 
      "Treat string as multiple lines. That is, change '^' and '$' from matching the start or end of line only at the left and right ends of the string to matching them anywhere within the string. 


Used together, as '/ms', they let the '.' match any character whatsoever, while still allowing '^' and '$' to match, respectively, just after and just before newlines within the string.")]


@chunk[<modifier_s>
(perl "treatStringAsSingleLine"
      "s" 
      "Treat string as single line. That is, change '.' to match any character whatsoever, even a newline, which normally it would not match. Used together, as /ms, they let the '.' match any character whatsoever, while still allowing '^' and '$' to match, respectively, just after and just before newlines within the string.


Used together, as /ms, they let the '.' match any character whatsoever, while still allowing '^' and '$' to match, respectively, just after and just before newlines within the string." )]


case insensitive matching
@chunk[<modifier_i>
(perl "caseInsensitive"
      "i"
      "Do case-insensitive pattern matching.

If locale matching rules are in effect, the case map is taken from the current locale for code points less than 255, and from Unicode rules for larger code points. However, matches that would cross the Unicode rules/non-Unicode rules boundary (ords 255/256) will not succeed. See perllocale.

There are a number of Unicode characters that match multiple characters under /i. For example, LATIN SMALL LIGATURE FI should match the sequence fi . Perl is not currently able to do this when the multiple characters are in the pattern and are split between groupings, or when one or more are quantified. Thus


    1. {LATIN SMALL LIGATURE FI} =~ /fi/i; # Matches
    2. {LATIN SMALL LIGATURE FI} =~ /[fi][fi]/i; # Doesn't match!
    3. {LATIN SMALL LIGATURE FI} =~ /fi*/i; # Doesn't match!
    # The below doesn't match, and it isn't clear what $1 and $2 would
    # be even if it did!!
    4. {LATIN SMALL LIGATURE FI} =~ /(f)(i)/i; # Doesn't match!


Perl doesn't match multiple characters in a bracketed character class unless the character that maps to them is explicitly mentioned, and it doesn't match them at all if the character class is inverted, which otherwise could be highly confusing. See Bracketed Character Classes in perlrecharclass, and Negation in perlrecharclass.")]

allow whitespace and comments
@chunk[<modifier_x>
(perl "AllowWhiteSpaceAndComments"
      "x" 
      "'x' tells the regular expression parser to ignore most whitespace that is neither backslashed nor within a character class. You can use this to break up your regular expression into (slightly) more readable parts. The # character is also treated as a metacharacter introducing a comment, just as in ordinary Perl code. This also means that if you want real whitespace or # characters in the pattern \\(outside a character class, where they are unaffected by x\\), then you'll either have to escape them \\(using backslashes or \\Q...\\E \\) or encode them using octal, hex, or \\N{} escapes. Taken together, these features go a long way towards making Perl's regular expressions more readable.

Note that you have to be careful not to include the pattern delimiter in the comment--perl has no way of knowing you did not intend to close the pattern early. See the C-comment deletion code in perlop. Also note that anything inside a \\Q...\\E stays unaffected by /x. And note that /x doesn't affect space interpretation within a single multi-character construct.

For example in \\x\\{...\\} , regardless of the /x modifier, there can be no spaces. Same for a quantifier such as {3} or {5,} . Similarly, \\(?:...\\) can't have a space between the \\(, ?, and : . Within any delimiters for such a construct, allowed spaces are not affected by /x, and depend on the construct. For example, \\x{...} can't have spaces because hexadecimal numbers don't have spaces in them. But, Unicode properties can have spaces, so in \\p{...} there can be spaces that follow the Unicode rules, for which see Properties accessible through \\p{} and \\P{} in perluniprops." )]

Preserve strings. 
@chunk[<modifier_p>
(perl "preserveStringMatched"
      "p" 
      "Preserve the string matched such that ${^PREMATCH}, ${^MATCH}, and ${^POSTMATCH} are available for use after matching.")]

Allow global matching. 
@chunk[<modifier_g>
(perl "useGlobalMatching"
      "g" 
      "Global matching effects the way a regexp is used rather than the regex. ")]

Keep current position. 
@chunk[<modifier_c>
(perl "keepCurrentPosition"
      "c" 
      "Current position effects the way regexp is used rather than the regex.")]

@subsection{Character set modifiers}

/d, /u , /a , and /l , available starting in 5.14, are called the character set modifiers; they affect the character set semantics used for the regular expression.

The /d, /u , and /l modifiers are not likely to be of much use to you, and so you need not worry about them very much. They exist for Perl's internal use, so that complex regular expression data structures can be automatically serialized and later exactly reconstituted, including all their nuances. But, since Perl can't keep a secret, and there may be rare instances where they are useful, they are documented here.

Allow ASCII safe unicode matching. 
@chunk[<modifier_a>
(perl "asciiSafeMatching"
      "a" 
      "ASCII safe matching is to allow code that is to work mostly on ASCII data to not have to concern itself with Unicode.")]

Use default character set. 
@chunk[<modifier_d>
(perl "defaultCharacterSetMatching"
      "d" 
      "/d is the Perl Programming Language's old, problematic, pre-5.14 Default character set behavior. Its only use is to force that old behavior.")]

use unicode character set
@chunk[<modifier_u>
(perl "uniCodeCharcacterSetMatching"
      "u" 
      "Sets the character set to UniCode")]

use local character set
@chunk[<modifier_l>
(perl "localeCharacterSetMatching"
      "l" 
      "Briefly, /l sets the character set to that of whatever Locale is in effect at the time of the execution of the pattern match.")]










