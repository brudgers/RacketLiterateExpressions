#lang scribble/lp


@section{Escape Sequence Definitions}

The escape characters consist of three groups. The first maps directly to a character. The second group modifies the matching pattern of either the next character or a range of characters up to the character signaling the end of the range. The third group indicate that a specific type of characer is following. This third group will require overriding in most implementatoins. In Racket the override will be by function. In other languages it might be by an object's method call or some other means.

@chunk[<Perl-EscapeSequences>
       <Perl-EscapeSequences_requires>
       <Perl-EscapeSequences_provide>
       (define escape_tab <escape_tab>)
       (define escape_newline <escape_newline>)
       (define escape_return <escape_return>)
       (define escape_formFeed <escape_formFeed>)
       (define escape_alarm <escape_alarm>)
       (define escape_escape <escape_escape>)
       (define escape_lowerCaseNextChar <escape_lowerCaseNextChar>)
       (define escape_upperCaseNextChar <escape_upperCaseNextChar>)
       (define escape_lowerCaseUntilEnd <escape_lowerCaseUntilEnd>)
       (define escape_upperCaseUntilEnd <escape_upperCaseUntilEnd>)
       (define escape_quoteUntilEnd <escape_quoteUntilEnd>)
       (define escape_endModOrQuote <escape_endModOrQuote>)
       (define escape_controlChar <escape_controlChar>)
       (define escape_hexadecimal <escape_hexadecimal>)
       (define escape_namedUniCode <escape_namedUniCode>)
       (define escape_uniCode <escape_uniCode>)
       (define escape_octalCharacter <escape_octalCharacter>)
       ]

@chunk[<Perl-EscapeSequences_requires>
       (require "Lexp-structures.rkt")]

@chunk[<Perl-EscapeSequences_provide>
       (provide (all-defined-out))
       (provide 
        (all-from-out  "Lexp-structures.rkt"))]

@subsection{Base Escape Sequences}

The base escape sequences generally represent ASCII whitespace characters or simple terminal characters.

@chunk[<escape_tab>
       (perl "tab"
	     "\\t"
	     "The tab character: HT, TAB")]

@chunk[<escape_newline>
       (perl "newline"
	     "\\n"
	     "The newline character: LF, NL")]

@chunk[<escape_return>
       (perl "return"
	     "\\r"
	     "The return character: CR")]

@chunk[<escape_formFeed>
       (perl "formFeed"
	     "\\f"
	     "The form feed character: FF")]

@chunk[<escape_alarm>
       (perl "alarm"
	     "\\a"
	     "The alarm or bell character: BEL")]

@chunk[<escape_escape>
       (perl "escape"
	     "\\e"
	     "The escape character <thing troff>: ESC")]

@subsection{Escape Ranged Delimiters}

These characters change the interpretation of the Regex for a limited range of characters - some just for the next character, others until the \E character is encountered to end the range.


@chunk[<escape_lowerCaseNextChar>
       (perl "lowerCaseCharacterNext"
	     "\\l"
	     "Lower case next char - think vi")]

@chunk[<escape_upperCaseNextChar>
       (perl "upperCaseCharacterNext"
	     "\\u"
	     "Upper case next char - think vi")]

@chunk[<escape_lowerCaseUntilEnd>
       (perl "lowerCaseUntilEnd"
	     "\\L"
	     "Lower case until encountering the \\E character [endModOrQuote]")]

@chunk[<escape_upperCaseUntilEnd>
       (perl "upperCaseUntilEnd"
	     "\\U"
	     "Upper case until encountering the \\E character [endModOrQuote]")]

@chunk[<escape_quoteUntilEnd>
       (perl "quoteUntilEnd"
	     "\\Q"
	     "Disable (quote) pattern MetaCharcters until encountering the \\E character [endModOrQuote]")]

@chunk[<escape_endModOrQuote>
       (perl "endEscape"
	     "\\E"
	     "End either case modification or quoted section - think vi")]

@subsection{Escape Sequences Requiring Override}

These sequences will require overriding in many implementations. In Racket and most other languages, this will probably be as a function or an object method so that they may be composed with the needed argument.

@chunk[<escape_controlChar>
       (perl "controlChar"
	     "\\cK"
	     "A control character: example = VT")]


@chunk[<escape_hexadecimal>
       (perl "hexadecimal"
	     "\\x{}, \\x00"
	     "The character whose ordinal is the given hexidecimal number. Implementation must over-ride")]


@chunk[<escape_namedUniCode>
       (perl "namedUniCode"
	     "\\N{name}"
	     "A named unicode character. Implementation must over-ride")]


@chunk[<escape_uniCode>
       (perl "numberedUniCode"
	     "\\N{U+264D}"
	     "A UniCode Character given by number. Implementation must over-ride.")]

@chunk[<escape_octalCharacter>
       (perl "octalCharcter"
	     "\\o{}, \\000"
	     "A charcter whose ordinal is the given octal number. Implementation must over-ride")]





















