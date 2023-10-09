% ------------------------------------------------------------------------------
% BlueFin CV - A RESUME CLASS FILE
% This class file defines the structure and design of the template.
%
% Copyright (c) 2020-2023 Josh Finnie <josh@jfin.us>
%
% Permission is hereby granted, free of charge, to any person obtaining a copy
% Of this software and associated documentation files (the "Software"), to deal
% In the Software without restriction, including without limitation the rights
% To use, copy, modify, merge, publish, distribute, sublicense, and/or sell
% Copies of the Software, and to permit persons to whom the Software is
% Furnished to do so, subject to the following conditions:
%
% The above copyright notice and this permission notice shall be included in all
% Copies or substantial portions of the Software.
%
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
% SOFTWARE.
% ------------------------------------------------------------------------------

\ProvidesClass{bluefin_cv}[2023/09/25 v0.2 BlueFin CV class]
\NeedsTeXFormat{LaTeX2e}

\LoadClass[10pt,letterpaper]{article}   % Font size and paper type

\usepackage[parfill]{parskip}           % Remove paragraph indentation
\usepackage{array}                      % Required for boldface (\bf and \bfseries) tabular columns
\usepackage{ifthen}                     % Required for ifthenelse statements
\usepackage{ragged2e}

\pagestyle{empty}                       % Suppress page numbers
\justifying


\RequirePackage{fontawesome}
\RequirePackage[hidelinks,unicode]{hyperref}
\RequirePackage{titlesec}

% ------------------------------------------------------------------------------
% HELPER FORMATTING
% ------------------------------------------------------------------------------
\newcommand*{\namesize}{\huge}                    % Size of the name at the top of the document
\newcommand*{\titlesize}{\large}

% ------------------------------------------------------------------------------
% HEADINGS COMMANDS: Commands for printing name and information
% ------------------------------------------------------------------------------

% Define name
\newcommand*{\name}[2]{\def\@firstname{#1}\def\@lastname{#2}}
\newcommand*{\firstname}[1]{\def\@firstname{#1}}
\newcommand*{\lastname}[1]{\def\@lastname{#1}}

% Defines mobile (optional)
\newcommand*{\phone}[1]{\def\@phone{#1}}

% Defines email (optional)
\newcommand*{\email}[1]{\def\@email{#1}}

% Defines homepage (optional)
\newcommand*{\homepage}[1]{\def\@homepage{#1}}

% Defines github (optional)
\newcommand*{\github}[1]{\def\@github{#1}}

% Defines linkedin (optional)
\newcommand*{\linkedin}[1]{\def\@linkedin{#1}}

% Defines twitter (optional)
\newcommand*{\twitter}[1]{\def\@twitter{#1}}

% Defines horizontal bar for separation
\newcommand{\infoSep}{\quad\textbar\quad}

% Defines makeheader
\newcommand*{\makeheader}{
  \centering
    \MakeUppercase{\namesize\bf \@firstname\space\@lastname}
    \smallskip
    \par
    \newbool{isstart}
    \booltrue{isstart}
    \ifthenelse{\isundefined{\@phone}}
      {}
      {
        \ifbool{isstart}{
          \boolfalse{isstart}
        }{
          \infoSep
        }
        \faMobile\space\@phone
      }
    \ifthenelse{\isundefined{\@email}}
      {}
      {
        \ifbool{isstart}{
          \boolfalse{isstart}
        }{
          \infoSep
        }
        \href{mailto:\@email}{\faEnvelope\space\@email}
      }
    \ifthenelse{\isundefined{\@homepage}}
      {}
      {
        \ifbool{isstart}{
          \boolfalse{isstart}
        }{
          \infoSep
        }
        \href{http://\@homepage}{\faGlobe\space\@homepage}
      }
    \ifthenelse{\isundefined{\@linkedin}}
      {}
      {
        \ifbool{isstart}{\setbool{isstart}{false}}{\infoSep}
        \href{https://www.linkedin.com/in/\@linkedin/}{\faLinkedinSquare\space\@linkedin}
      }
    \ifthenelse{\isundefined{\@twitter}}
      {}
      {
        \ifbool{isstart}{\setbool{isstart}{false}}{\infoSep}
        \href{https://twitter.com/\@twitter}{\faTwitter\space\@twitter}
      }
}

%------------------------------------------------------------------------------
%  SECTION FORMATTING
%------------------------------------------------------------------------------
\titleformat{\section}
{
  \raggedright
  \bf
}
{}{0em}
{\MakeUppercase}
[\titlerule]

\titleformat{\subsection}
  {\raggedright}
  {}{0em}
  {}

%------------------------------------------------------------------------------
%  WORK EXPERIENCE FORMATTING
%------------------------------------------------------------------------------
\newcommand{\datedsubsection}[3]{
  \subsection{{\bf #1} \hspace{1em}#3 \hfill #2}
}

\newcommand{\bfcvjobdescription}[1]{
  \justify{#1}
  \newline
  \newline
}

\newenvironment{bfcvsuccesslist}{
  Highlighted Successes:
  \begin{list}{$\cdot$}{\leftmargin=1em}
   \itemsep -0.5em \vspace{-0.5em}
 }{
  \end{list}
}

\newenvironment{bfcvlist}{
  \begin{list}{$\cdot$}{\leftmargin=1em}
   \itemsep -0.5em \vspace{-0.5em}
 }{
  \end{list}
}

\newcommand{\technologies}[1]{
  {\em Technologies Used}: #1
  \vspace{-0.5em}
}

%------------------------------------------------------------------------------
%  PROJECT FORMATTING
%------------------------------------------------------------------------------

\newcommand{\projectsubsection}[2]{
  \subsection{{\bf #1} \hfill #2}
  \vspace{-0.5em}
}

\newcommand{\bfcvtalk}[3]{
  #1 - {\em #2}, #3
}

\newcommand{\education}[2]{
  {\bf #1}
  \newline
  \indent\hspace{1em} #2
  \newline
}
