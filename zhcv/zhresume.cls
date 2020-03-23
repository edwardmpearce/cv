%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Medium Length Professional Chinese CV - RESUME CLASS FILE
%
% This template has been downloaded from:
% http://www.LaTeXTemplates.com
%
% This class file defines the structure and design of the template. 
%
% Original header:
% Copyright (C) 2010 by Trey Hunner
%
% Copying and distribution of this file, with or without modification,
% are permitted in any medium without royalty provided the copyright
% notice and this notice are preserved. This file is offered as-is,
% without any warranty.
%
% Created by Trey Hunner and modified by www.LaTeXTemplates.com
%
% Modified (19/03/2020) to support Chinese language and profile picture by:
% Edward Pearce (https://edwardmpearce.github.io)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{zhresume}[2010/07/10 v0.9 Resume class]

\LoadClass[10pt,letterpaper]{ctexart} % Font size and paper type, renders Chinese characters, compile with XeLaTeX

\usepackage[parfill]{parskip} % Remove paragraph indentation
\usepackage{array} % Required for boldface (\bf and \bfseries) tabular columns
\usepackage{ifthen} % Required for ifthenelse statements
\usepackage{graphicx} % For including profile picture
\usepackage{tikz} % To position the picture

\pagestyle{empty} % Suppress page numbers

%----------------------------------------------------------------------------------------
%  HEADINGS COMMANDS: Commands for printing name and address
%----------------------------------------------------------------------------------------

\def \name#1{\def\@name{#1}} % Defines the \name command to set name
\def \@name {} % Sets \@name to empty by default

\def \setimgpath#1{\def\@imagepath{#1}} % Defines the \setimagepath command to set image path
\def \@imagepath {} % Sets \@imagepath to empty by default

\def \addressSep {|} % Set address separator

% One, two or three address lines can be specified 
\let \@addressone \relax
\let \@addresstwo \relax
\let \@addressthree \relax

% \address command can be used to set the first, second, and third address (last 2 optional)
\def \address #1{
  \@ifundefined{@addresstwo}{
    \def \@addresstwo {#1}
  }{
    \@ifundefined{@addressthree}{
      \def \@addressthree {#1}
  }{
    \def \@addressone {#1}
  }}
}

% \printaddress is used to style an address line (given as input)
\def \printaddress #1{
  \begingroup
    \def \\ {\addressSep\ }
    \centerline{#1}
  \endgroup
  \par
  \addressskip
}

% \printname is used to print the name as a page header
\def \printname {
  \begingroup
    \hfil{\MakeUppercase{\namesize\bf \@name}}\hfil
    \nameskip\break
  \endgroup
}

% \addprofilepic is used to display a profile picture in the top right corner
\def \addprofilepic {
  \begin{tikzpicture}[remember picture, overlay]
  \node[anchor=north east,inner sep=25pt, xshift=-30pt] at (current page.north east)
  {\includegraphics[width=0.15\textwidth]{\@imagepath}};
  \end{tikzpicture}
}

%----------------------------------------------------------------------------------------
%  PRINT THE HEADING LINES
%----------------------------------------------------------------------------------------

\let\ori@document=\document
\renewcommand{\document}{
  \ori@document  % Begin document
  \addprofilepic % Display the picture specified by \@imagepath
  \printname % Print the name specified with \name
  \@ifundefined{@addressone}{}{ % Print the first address if specified
    \printaddress{\@addressone}}
  \@ifundefined{@addresstwo}{}{ % Print the second address if specified
    \printaddress{\@addresstwo}}
  \@ifundefined{@addressthree}{}{ % Print the third address if specified
    \printaddress{\@addressthree}}
}

%----------------------------------------------------------------------------------------
%  SECTION FORMATTING
%----------------------------------------------------------------------------------------

% Defines the rSection environment for the large sections within the CV
\newenvironment{rSection}[1]{ % 1 input argument - section name
  \sectionskip
  \MakeUppercase{\bf #1} % Section title
  \sectionlineskip
  \hrule % Horizontal line
  \begin{list}{}{ % List for each individual item in the section
    \setlength{\leftmargin}{0.0em} % Margin within the section
  }
    \item[]
  }{
  \end{list}
}

%----------------------------------------------------------------------------------------
%  WORK EXPERIENCE FORMATTING
%----------------------------------------------------------------------------------------

\newenvironment{rSubsection}[4]{ % 4 input arguments - company name, year(s) employed, job title and location
  \vspace{-0.5em}
  {\bf #1} \hfill {#2} % Bold company name and date on the right
  \ifthenelse{\equal{#3}{}}{}{ % If the third argument is not specified, don't print the job title and location line
    \vspace{-0.3em} \\
    {#3} \hfill {#4} % Italic job title and location
  }\vspace{-0.1em}
  \begin{list}{$\cdot$}{\leftmargin=0em} % \cdot used for bullets, no indentation
    \itemsep -1.0em \vspace{-0.8em} % Compress items in list together for aesthetics
  }{
  \end{list}
  \vspace{-0.4em} % Some space after the list of bullet points
}

% The below commands define the whitespace after certain things in the document - they can be \smallskip, \medskip or \bigskip
\def\namesize{\huge} % Size of the name at the top of the document
\def\addressskip{\vspace{-0.5em}} % The space between the two address (or phone/email) lines
\def\sectionlineskip{\vspace{0.1em}} % The space above the horizontal line for each section 
\def\nameskip{\vspace{-0.3em}} % The space after your name at the top
\def\sectionskip{\vspace{-0.2em}} % The space after the heading section
