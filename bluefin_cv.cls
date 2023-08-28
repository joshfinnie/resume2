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

\ProvidesClass{bluefin_cv}[2023/05/23 v0.2 BlueFin CV class]
\NeedsTeXFormat{LaTeX2e}

\LoadClass[10pt,letterpaper]{article}   % Font size and paper type

\usepackage[parfill]{parskip}           % Remove paragraph indentation
\usepackage{array}                      % Required for boldface (\bf and \bfseries) tabular columns
\usepackage{ifthen}                     % Required for ifthenelse statements
\usepackage{ragged2e}
\raggedright

\pagestyle{empty}                       % Suppress page numbers


\RequirePackage{fontawesome}
\RequirePackage[hidelinks,unicode]{hyperref}
% ------------------------------------------------------------------------------
% HELPER FORMATTING
% ------------------------------------------------------------------------------
\newcommand*{\namesize}{\huge}                    % Size of the name at the top of the document
\newcommand*{\titlesize}{\large}
\newcommand*{\infoskip}{\smallskip}               % The space between the two information (or phone/email) lines
\newcommand*{\sectionlineskip}{\medskip}          % The space above the horizontal line for each section
\newcommand*{\nameskip}{\smallskip}               % The space after your name at the top
\newcommand*{\sectionskip}{\medskip}              % The space after the heading section

% ------------------------------------------------------------------------------
%	HEADINGS COMMANDS: Commands for printing name and informatino
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
    \nameskip
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

% Defines the bfcvSection environment for the large sections within the CV
\newenvironment{bfcvSection}[1]{        % 1 input argument - section name
  \raggedright
  \sectionskip
  \MakeUppercase{\bf #1}                % Section title
  \sectionlineskip
  \hrule                                % Horizontal line
  \begin{list}{}{                       % List for each individual item in the section
    \setlength{\leftmargin}{1.5em}      % Margin within the section
  }
  \item[]
}{
  \end{list}
}

%------------------------------------------------------------------------------
%  WORK EXPERIENCE FORMATTING
%------------------------------------------------------------------------------

% Defines the bfcvWorkSubsection environment for the work experiences within the CV
\newenvironment{bfcvWorkSubsection}[3]{             % 3 input arguments - company name, year(s) of employment, and job title
 {\bf #1}\hspace{1em}{#3} \hfill {#2}                               % Bold company name and put date on the right
  \smallskip
  \begin{list}{$\cdot$}{\leftmargin=1em}            % \cdot used for bullets, no indentation
   \itemsep -0.5em \vspace{-0.5em}                  % Compress items in list together for aesthetics
  }{
  \end{list}
  \vspace{0.5em}                                    % Some space after the list of bullet points
}

% Defines the bfcvItemlessWorkSubsection environment for the work experiences with no items within the CV
\newenvironment{bfcvItemlessWorkSubsection}[3]{     % 3 input arguments - company name, year(s) of employment, and job title
 {\bf #1} \hfill {#2}                               % Bold company name and put date on the right
 \ifthenelse{\equal{#3}{}}{}{                       % If the third argument is not specified, don't print the job title
  \\
  {\em #3}                                          % Italic job title
  }
}

%------------------------------------------------------------------------------
%  PROJECT FORMATTING
%------------------------------------------------------------------------------

% Defines the bfcvProjSubsection enviroment for the highlighted projects within the CV
\newenvironment{bfcvProjSubsection}[2]{     % 2 input arguments - project title, project url
 {\bf #1} \hfill {#2}                       % Bold company name and date on the right
  \begin{list}{}{\leftmargin=0em}           % \cdot used for bullets, no indentation
   \itemsep -0.5em \vspace{-0.5em}          % Compress items in list together for aesthetics
  }{
  \end{list}
  }

%------------------------------------------------------------------------------
%  STANDALONE LIST FORMATTING
%------------------------------------------------------------------------------

% Defines bfcvListSubsection environment for generic lists within the CV
\newenvironment{bfcvListSubsection}[0]{
  \medskip                                      % Giving a little space from header
  \begin{list}{$\cdot$}{\leftmargin=0.5em}      % \cdot used for bullets, no indentation
   \itemsep -0.5em \vspace{-0.5em}              % Compress items in list together for aesthetics
  }{
  \end{list}
  }
