% ------------------------------------------------------------------------------
% ast_resume - A resume that can easily be read by ASTs.
% This class file defines the structure and design of the template.
%
% Copyright (c) 2024 Josh Finnie <josh@jfin.us>
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
\ProvidesClass{ast_resume}[2024/09/30 v0.1 ast_resume class]
\NeedsTeXFormat{LaTeX2e}

\LoadClass[10pt, a4paper]{article}
\renewcommand{\familydefault}{\sfdefault}

% ------------------------------------------------------------------------------
% Package Imports
% ------------------------------------------------------------------------------
\RequirePackage{enumitem}
\RequirePackage{etoolbox}
\RequirePackage{fontawesome}
\RequirePackage[hidelinks,unicode]{hyperref}
\RequirePackage{xparse}

\usepackage{ragged2e}
\usepackage{setspace}
\usepackage{titlesec}

% ------------------------------------------------------------------------------
% Style
% ------------------------------------------------------------------------------
\usepackage[left=0.5in,top=0.5in,right=0.5in,bottom=0.5in]{geometry}
\newcommand*{\namesize}{\huge}
\newcommand*{\titlesize}{\large}

\setcounter{secnumdepth}{0}
\titlespacing{\subsection}{0pt}{*0}{*0} % remove vertical spacing above and below
\titlespacing{\subsubsection}{0pt}{*0}{*0}
\titleformat{\section}{\large\bfseries\uppercase}{}{}{}
\titleformat*{\subsubsection}{\large\itshape}

\onehalfspacing

% ------------------------------------------------------------------------------
% Basic Layout Configuration
% ------------------------------------------------------------------------------
\pagestyle{empty}
\pdfgentounicode=1

% ------------------------------------------------------------------------------
% Header Definition
% ------------------------------------------------------------------------------
\NewDocumentCommand{\fullname}{ m m }{
  \def\@firstname{#1}
  \def\@lastname{#2}
}

\NewDocumentCommand{\position}{ m }{
  \def\@position{#1}
}

% Contact Information
\newcommand*{\email}[1]{\def\@email{#1}}
\newcommand*{\phone}[1]{\def\@phone{#1}}
\newcommand*{\homepage}[1]{\def\@homepage{#1}}
\newcommand*{\linkedin}[1]{\def\@linkedin{#1}}
\newcommand*{\github}[1]{\def\@github{#1}}
\newcommand*{\location}[1]{\def\@location{#1}}

% ------------------------------------------------------------------------------
% Header Layout
% ------------------------------------------------------------------------------
\newcommand*{\makeheader}{
  \noindent
  \begin{minipage}[t]{0.6\textwidth} % Left column: Name and title
    \RaggedRight
    \namesize{\bf\@firstname\space\@lastname}\newline
    \vspace{-0.25em}
    {\titlesize\@position}
  \end{minipage}%
  \begin{minipage}[t]{0.4\textwidth} % Right column: Contact information
    \RaggedLeft
    \footnotesize{
      \ifdef{\@email}{\faEnvelope\space\href{mailto:\@email}{\textit{\@email}}\newline}{}
      \ifdef{\@homepage}{\faGlobe\space\href{http://\@homepage}{\textit{\@homepage}}\newline}{}
      \ifdef{\@linkedin}{\faLinkedinSquare\space\href{https://www.linkedin.com/in/\@linkedin/}{\textit{/\@linkedin}}\newline}{}
      \ifdef{\@github}{\faGithub\space\href{https://www.github.com/\@github/}{\textit{/\@github}}\newline}{}
      \ifdef{\@phone}{\faPhone\space\textit{\@phone}\newline}{}
      \ifdef{\@location}{\faHome\space\textit{\@location}}{}
    }
  \end{minipage}
  \newline
  \par
}

% ------------------------------------------------------------------------------
% Work Experience Layout
% ------------------------------------------------------------------------------
\newcommand*{\workexperience}[7]{
  \noindent
  \textbf{#1} \hfill {\small #2} \newline
  \textit{#3} \textbar\ \textit{#4} \\[8pt]
  #5 \newline
  Technologies: #7
  \begin{itemize}[leftmargin=1em, itemsep=0em, topsep=0.25em]
    #6
  \end{itemize}
  \par
}


% ------------------------------------------------------------------------------
% Personal Project Layout
% ------------------------------------------------------------------------------
\newcommand*{\project}[3]{
  \noindent
  \textbf{#1} \hfill {\small #2}
  \justify{#3}
  \par
}

% ------------------------------------------------------------------------------
% Education Layout
% ------------------------------------------------------------------------------
\newcommand{\education}[2]{
  \noindent
  {\bf #1}\newline
  #2
  \par
}
