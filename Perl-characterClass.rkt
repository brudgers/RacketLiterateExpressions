#lang scribble/lp

@section{Character Classes}


@chunk[<bracketedClass>
       (perl
	"bracketedClass"
	"[...]"
	"Match a character according to the rules of the
bracketed character class defined by the '...'.
Example: [a-z] matches 'a' or 'b' or 'c' ... or 'z'")]

@chunk[<matchWordChar>
       (perl
	"matchWordChar"
	"\w"
	"Match a 'word' character (alphanumeric plus '_', plus
other connector punctuation chars plus Unicode
marks).")]

@chunk[<matchNonWordChar>
       (perl
	"matchNonWordChar"
	"\W"
	"Match a non-'word' character.")]

@chunk[<matchWhitespaceChar>
       (perl
	"matchWhitespaceChar"
	"\s"
	"Match a white-space character.")]

@chunk[<matchNonWhitespaceChar>
       (perl
	"matchNonWhitespaceChar"
	"\S"
	"Match a non-white-space character.")]

@chunk[<matchDigitChar>
       (perl
	"matchDigitChar"
	"\d"
	"Match a decimal digit character.")]

@chunk[<matchNon-digitChar>
       (perl
	"matchNon-digitChar"
	"\D"
	"Match a non-digit character.")]

@chunk[<matchProperty>
       (perl
	"matchProperty"
	"\pP"
	"Match P, named property. Use p{Prop} for longer names.")]

@chunk[<matchNotProperty>
       (perl
	"matchNotProperty"
	"\PP"
	"Match non-P.")]

@chunk[<extendedGraphemeCluster>
       (perl
	"extendedGraphemeCluster"
	"\X"
	"Match Unicode 'eXtended grapheme cluster.'")]

@chunk[<c-LanguageCharacter>
       (perl
	"c-LanguageCharacter"
	"\C"
	"Match a single C-language char (octet) even if that is part of a larger UTF-8 character, thus it breaks up characters into their UTF-8 bytes, so you may end up with malformed pieces of UTF-8, unsupported in look-behind.")]

@chunk[<backreferenceToSpecific>
       (perl
	"backreferenceToSpecific"
	"\1"
	"Backreference to a specific capture group or buffer. '1' may be any positive integer.")]

@chunk[<backreferenceToSpecific>
       (perl
	"backreferenceToSpecificOrPrevious"
	"\g1"
	"Backreference to a specific or previous group. '\g{-1}' The number may be negative indicating a relative previous group and may optionally be wrapped in curly brackets for safer parsing. '\g{name}' a named backreference is also possible.")]

@chunk[<namedBackreference>
       (perl
	"namedBackreference"
	"\k<name>"
	"Named backreference.")]

@chunk[<keepToTheLeft>
       (perl
	"keepToTheLeft"
	"\K"
	"Keep the stuff to the left of the '\K', don't include it in $&.")]


@chunk[<exceptNewline>
       (perl
	"exceptNewline"
	"\N"
	"Match any character except '\n'.")]

@chunk[<veritcalWhitespace>
       (perl
	"veritcalWhitespace"
	"\v"
	"Vertical Whitespace.")]

@chunk[<notVeritcalWhitespace>
       (perl
	"notVeritcalWhitespace"
	"\V"
	"Not Vertical Whitespace.")]


@chunk[<horizontalWhitespace>
       (perl
	"horizontalWhitespace"
	"\h"
	"Horizontal Whitespace.")]

@chunk[<notHorizontalWhitespace>
       (perl
	"notHorizontalWhitespace"
	"\H"
	"Not Horizontal Whitespace.")]

@chunk[<linebreak>
       (perl
	"linebreak"
	"\R"
	"Linebreak.")]

@chunk[<negate>
       (perl
	"negate"
	"^"
	"Match characters not in class.")]


@subsection{POSIX Classes}

@chunk[<POSIXalpha>
       (perl
	"POSIXalpha"
	"[[:alpha:]]"
	"Contains a-z,A-Z")]

@chunk[<POSIXupper>
       (perl
	"POSIXupper"
	"[[:upper:]]"
	"Contains A-Z.")]

@chunk[<POSIXlower>
       (perl
	"POSIXlower"
	"[[:lower:]]"
	"Contains a-z.")]

@chunk[<POSIXdigit>
       (perl
	"POSIXdigit"
	"[[:digit:]]"
	"Contains 0-9.")]

@chunk[<POSIXxdigit>
       (perl
	"POSIXxdigit"
	"[[:xdigit:]]"
	"Contains 0-9, a-f, A-F.")]

@chunk[<POSIXalnum>
       (perl
	"POSIXalnum"
	"[[:alnum:]]"
	"Contains a-z, A-Z, 0-9.")]

@chunk[<POSIXword>
       (perl
	"POSIXword"
	"[[:word:]]"
	"Contains a-z, A-Z, 0-9, _.")]

@chunk[<POSIXblank>
       (perl
	"POSIXblank"
	"[[:blank:]]"
	"Contains space and tab.")]

@chunk[<POSIXspace>
       (perl
	"POSIXspace"
	"[[:space:]]"
	"Contains space, tab, newline, formfeed, return.")]

@chunk[<POSIXgraph>
       (perl
	"POSIXgraph"
	"[[:graph:]]"
	"Contains all ASCII characters that use ink.")]

@chunk[<POSIXprint>
       (perl
	"POSIXprint"
	"[[:print:]]"
	"Contains Tab whitespace and all ASCII ink users.")]

@chunk[<POSIXcntrl>
       (perl
	"POSIXcntrl"
	"[[:cntrl:]]"
	"Contains all characters with a scalar value less than 32.")]

@chunk[<POSIXascii>
       (perl
	"POSIXascii"
	"[[:ascii:]]"
	"Contains all ASCII characters.")]

@chunk[<POSIXpunct>
       (perl
	"POSIXpunct"
	"[[:punct:]]"
	"Contains any graphical character excluding [[:word:]] characters.")]


@section{Assertions}

@chunk[<wordBoundry>
       (perl
	"wordBoundry"
	"\b"
	"Match word boundary.")]

@chunk[<exceptWordBoundry>
       (perl
	"exceptWordBoundry"
	"\B"
	"Match except at word boundary.")]

@chunk[<onlyAtBeginning>
       (perl
	"onlyAtBeginning"
	"\A"
	"Match only at beginning of string.")]

@chunk[<onlyAtEndOrTerminalNewline>
       (perl
	"onlyAtEndOrTerminalNewline"
	"\Z"
	"Match only at end of string or before new-line at end of string.")]

@chunk[<onlyAtEnd>
       (perl
	"onlyAtEnd"
	"\z"
	"Match only at end of string.")]

@chunk[<onlyAtPosition>
       (perl
	"onlyAtPosition"
	"\G"
	"Match only at pos() - e.g. at the end-of-match position of prior m/ /g.")]

