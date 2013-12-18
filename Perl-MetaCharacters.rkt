#lang scribble/lp

@section{Metacharacter Definitions}

From the Racket Documentaiton:

When we want a literal \ inside a Racket string or regexp literal, we must escape it so that it shows up in the string at all. Racket strings use \ as the escape character, so we end up with two \s: one Racket-string \ to escape the regexp \, which then escapes the .. Another character that would need escaping inside a Racket string is ".

@chunk[<MetaCharacters>
       <Perl-MetaCharacters_requires>
       <Perl-MetaCharacters_provide>
       <quoteNextMetaCharacter>
       <matchBeginningOfLine>
       <matchAnyCharacter>
       <matchEndOfLine>
       <alternation>
       <startGrouping>
       <endGrouping>
       <StartBracketedCharacterClass>
       <endBracketedCharacterClass>
       <startArgument>
       <endArgument>
       <matchZeroOrMoreTimes>
       <matchOneOrMoreTimes>
       <matchOneOrZeroTimes>
       <matchExactlyNTimes>
       <matchAtLeastNTimes>
       <matchAtLeastNTimesNotMoreThanMTimes>
       <nonGreedyMatchZeroOrMoreTimes>
       <nonGreedyMatchOneOrMOreTimes>
       <nonGreedyMatchOneOrZeroTimes>
       <nonGreedyMatchExactlyNTimes>
       <nonGreedyMatchAtLeastNTimes>
       <nonGreedyMatchAtLeastNTimesNotMoreThanMTimes>]

@chunk[<Perl-MetaCharacters_requires>
       (require "Lexp-structures.rkt")]


@chunk[<Perl-MetaCharacters_provide>
       (provide (all-defined-out))
       (provide 
        (all-from-out  "Lexp-structures.rkt"))]


@subsection{"Grepish" MetaCharacters}

@chunk[<quoteNextMetaCharacter>
    (perl
    "quoteNextMetaCharacter"
    "\\"
    "Quote the next metaCharacter. May require over riding to escape the slash character in a higher level use. Rendered as a double in base racket source code.")]

@chunk[<matchBeginningOfLine>
    (perl
    "matchBeginningOfLine"
    "^"
    "Match the beginning of the line.")]

@chunk[<matchAnyCharacter>
    (perl
    "matchAnyCharacter"
    "."
    "Match any charcter (except NewLine)")]

$@chunk[<matchEndOfLine>
    (perl
    "matchEndOfLine"
    "$"
    "Match the end of the line (or before Newline at the end)")]

@chunk[<alternation>
    (perl
    "alternation"
    "|"
    "Alternation - may require over riding for higher level constructs")]

@chunk[<startGrouping>
    (perl
    "startGrouping"
    "("
    "Starts Grouping - may require over riding for higher level constructs")]

@chunk[<endGrouping>
    (perl
    "endGrouping"
    ")"
    "Ends Grouping - may require over riding for higher level constructs")]


@chunk[<StartBracketedCharacterClass>
    (perl
    "StartBracketedCharacterClass"
    "["
    "Starts Bracketed Charcter Class - may require over riding for higher level constructs")]

@chunk[<endBracketedCharacterClass>
    (perl
    "endBracketedCharacterClass"
    "]"
    "Ends Bracketed Charcter Class - may require over riding for higher level constructs")]


@chunk[<startArgument>
    (perl
    "startArgument"
    "{"
    "Starts Argument - may require over riding for higher level constructs")]

@chunk[<endArgument>
    (perl
    "endArgument"
    "}"
    "Ends Argument - may require over riding for higher level constructs")]


@subsection{Greedy Quantifiers}

@chunk[<matchZeroOrMoreTimes>
    (perl
    "matchZeroOrMoreTimes"
    "*"
    "Match Zero (0) or more times - the Kleene star.")]

@chunk[<matchOneOrMoreTimes>
    (perl
    "matchOneOrMOreTimes"
    "+"
    "Match one (1) or more times.")]

@chunk[<matchOneOrZeroTimes>
    (perl
    "matchOneOrZeroTimes"
    "?"
    "Match One (1) or Zero (0) times.")]

@subsubsection{Greedy Quantifiers Requiring Over Ride}

@chunk[<matchExactlyNTimes>
    (perl
    "matchExactlyNTimes"
    "{n}"
    "Match exactly n times. Implementation must over-ride")]


@chunk[<matchAtLeastNTimes>
    (perl
    "matchAtLeastNTimes"
    "{n,}"
    "Match at least n times. Implementation must over-ride")]

@chunk[<matchAtLeastNTimesNotMoreThanMTimes>
    (perl
    "matchAtLeastNTimesNotMorThanMTimes"
    "{n,m}"
    "Match at least n times, but not more than m times. Implementation must over-ride")]


@subsection{Non-Greedy Quantifiers}

@chunk[<nonGreedyMatchZeroOrMoreTimes>
    (perl
    "nonGreedyMatchZeroOrMoreTimes"
    "*?"
    "Non Greedy Match Zero (0) or more times - the Kleene star.")]

@chunk[<nonGreedyMatchOneOrMOreTimes>
    (perl
    "nonGreedyMatchOneOrMOreTimes"
    "+?"
    "Non Greedy Match one (1) or more times.")]

@chunk[<nonGreedyMatchOneOrZeroTimes>
    (perl
    "nonGreedyMatchOneOrZeroTimes"
    "??"
    "Non Greedy Match One (1) or Zero (0) times.")]




@subsubsection{Non-Greedy Quantifiers Requiring Over Ride}

@chunk[<nonGreedyMatchExactlyNTimes>
    (perl
    "nonGreedyMatchExactlyNTimes"
    "{n}"
    "Non Greedy Match exactly n times. Implementation must over-ride")]


@chunk[<nonGreedyMatchAtLeastNTimes>
    (perl
    "nonGreedyMatchAtLeastNTimes"
    "{n,}"
    "Non Greedy Match at least n times. Implementation must over-ride")]

@chunk[<nonGreedyMatchAtLeastNTimesNotMoreThanMTimes>
    (perl
    "nonGreedyMatchAtLeastNTimesNotMorThanMTimes"
    "{n,m}"
    "Non Greedy Match at least n times, but not more than m times. Implementation must over-ride")]





















