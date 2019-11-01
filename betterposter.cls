%%%% Better Poster latex template v1.0 (2019/04/04)
%%%% GNU General Public License v3.0
%%%% Rafael Bailo
%%%% https://github.com/rafaelbailo/betterposter-latex-template
%%%%
%%%% Modified by Tom Kocmi for UFAL purposes
%%%% 
%%%% Original design from Mike Morrison
%%%% https://twitter.com/mikemorrison

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{betterposter}[2019/04/04 Better Poster latex template v1.0]

%% "article" as the base class
\LoadClass{article}
\pagestyle{empty}

%%%% REQUIRED PACKAGES

%% Paper size
\RequirePackage{geometry} 
\geometry{a0paper}

%% Remove default margins
\geometry{margin=0in}

%% Font
\RequirePackage{cmbright}
\RequirePackage[default]{lato}
\RequirePackage[T1]{fontenc}

%% Small separation on enumerate and itemize
\RequirePackage{enumitem}
\setlist{nolistsep}
\setenumerate{noitemsep}
\setitemize{noitemsep}
\setlength{\parindent}{0pt}

%% Colours
\RequirePackage{xcolor}
\definecolor{imperialblue}{RGB}{0,62,116}
\definecolor{empirical}{RGB}{0,77,64}
\definecolor{theory}{RGB}{26,35,126}
\definecolor{methods}{RGB}{140,22,22}
\definecolor{intervention}{RGB}{255,213,79}
\definecolor{ufal}{RGB}{244,123,32}

\newcommand{\columnbackgroundcolor}{white}
\newcommand{\columnfontcolor}{black}
\newcommand{\maincolumnbackgroundcolor}{ufal}
\newcommand{\maincolumnfontcolor}{black}

%% Graphics
\RequirePackage{graphicx}

%% AMS packages
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}

%% Other packages
\RequirePackage{qrcode}
\RequirePackage{wrapfig}
\RequirePackage{setspace}
\RequirePackage{multicol}
\RequirePackage{changepage}



%%%% SIZE COMMANDS

%% Poster lengths
\newlength{\leftbarwidth}
\newlength{\rightbarwidth}
\newlength{\columnmarginvertical}
\newlength{\columnmarginhorizontal}
\newlength{\maincolumnmarginvertical}
\newlength{\maincolumnmarginhorizontal}

%% Vertical lengths
\newlength{\topbarheight}
\newlength{\bottombarheight}
\newlength{\verticalleftsidebarwidth}
\newlength{\footermarginvertical}
\newlength{\footermarginhorizontal}

%%
\newcommand{\betterposter}[3]{\betterpostervertical{#1}{#2}{#3}}


%%%% SIZING OPTIONS

\newcommand{\fontsizestandard}{\fontsize{40.00}{62.75} \selectfont}
\newcommand{\fontsizemain}{\fontsize{116.00}{220.00} \selectfont}
\newcommand{\fontsizetitle}{\fontsize{60.00}{90.00} \selectfont}
\newcommand{\fontsizeauthor}{\fontsize{36.00}{51.00} \selectfont}
\newcommand{\fontsizesection}{\fontsize{48.00}{68.00} \selectfont}
\newcommand{\fontsizesubsection}{\fontsize{36.00}{51.00} \selectfont}
\newcommand{\fontsizesmall}{\fontsize{21.00}{33.14} \selectfont}


%% Paper orientation
\newif\iflandscape
\landscapefalse
\DeclareOption{landscape}{
\landscapetrue
\geometry{landscape}
\renewcommand{\betterposter}[3]{\betterposterhorizontal{#1}{#2}{#3}}
}

\DeclareOption{a2paper}{
\geometry{a2paper}
\renewcommand{\fontsizestandard}{\fontsize{14.00}{21.86} \selectfont}
\renewcommand{\fontsizemain}{\fontsize{58.00}{110.00} \selectfont}
\renewcommand{\fontsizetitle}{\fontsize{30.00}{37.50} \selectfont}
\renewcommand{\fontsizeauthor}{\fontsize{18.00}{25.50} \selectfont}
\renewcommand{\fontsizesection}{\fontsize{24.00}{34.00} \selectfont}
\renewcommand{\fontsizesubsection}{\fontsize{18.00}{25.00} \selectfont}
\newcommand{\fontsizesmall}{\fontsize{10.5}{16.39} \selectfont}
}

\DeclareOption{a1paper}{
\geometry{a1paper}
\renewcommand{\fontsizestandard}{\fontsize{19.80}{30.94} \selectfont}
\renewcommand{\fontsizemain}{\fontsize{82.02}{155.56} \selectfont}
\renewcommand{\fontsizetitle}{\fontsize{42.43}{53.03} \selectfont}
\renewcommand{\fontsizeauthor}{\fontsize{25.46}{36.06} \selectfont}
\renewcommand{\fontsizesection}{\fontsize{33.94}{48.08} \selectfont}
\renewcommand{\fontsizesubsection}{\fontsize{25.46}{36.06} \selectfont}
\newcommand{\fontsizesmall}{\fontsize{14.85}{23.21} \selectfont}
}

\DeclareOption{a0paper}{
\geometry{a0paper}
}

\newif\ifleftcolumns
\leftcolumnstrue
\DeclareOption{noleftcolumns}{
\leftcolumnsfalse
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

%% Default values for lengths
\setlength{\leftbarwidth}{0.3\paperwidth}
\setlength{\rightbarwidth}{0.2\paperwidth}
\setlength{\columnmarginvertical}{0.025\paperheight}
\setlength{\columnmarginhorizontal}{0.025\paperheight}
\setlength{\maincolumnmarginvertical}{0.05\paperheight}
\setlength{\maincolumnmarginhorizontal}{0.05\paperheight}

%% Default value for vertical lengths
\setlength{\topbarheight}{0.3\paperheight}
\setlength{\bottombarheight}{0.1\paperheight}
\setlength{\verticalleftsidebarwidth}{0.66\paperwidth}
\setlength{\footermarginvertical}{0.02\paperheight}
\setlength{\footermarginhorizontal}{0.02\paperheight}


%%%% TEMPLATE COMMANDS


%% Main beterposter command HORIZONTAL
\newcommand{\betterposterhorizontal}[3]{%
\noindent
% Left column
\column{\dimexpr 1.0\textheight\relax}{\leftbarwidth}%
{\columnbackgroundcolor}{\columnfontcolor}{\columnmarginvertical}{\columnmarginhorizontal}{
\papertitle{\title}
\paperauthor{\author}{\email}
\logos{0.4\textwidth}
\institution{0.6\textwidth}
#2}%
% Central column
\column{\dimexpr 1.0\textheight\relax}{
\dimexpr 1.0\textwidth-\leftbarwidth-\rightbarwidth\relax
}{\maincolumnbackgroundcolor}{\maincolumnfontcolor}{\maincolumnmarginvertical}{\maincolumnmarginhorizontal}{
\maincolumn{#1}{\qr{\urlQRcode}
\vspace{5em}
{\fontsizesmall\acknowledgement\par}
}}%
% Right column
\column{\dimexpr 1.0\textheight\relax}{\rightbarwidth}%
{\columnbackgroundcolor}{\columnfontcolor}{\columnmarginvertical}{\columnmarginhorizontal}{#3}%
}


%% Main beterposter command VERTICAL
\newcommand{\betterpostervertical}[3]{%
\noindent
% Main/Central column
% TODO nevim co s tim je, ze nejde dat 1.0
\vcolumn{\dimexpr 0.99\topbarheight\relax}{
\dimexpr \textwidth\relax
}{\maincolumnbackgroundcolor}{\maincolumnfontcolor}{\maincolumnmarginvertical}{\maincolumnmarginhorizontal}{
\centering
\fontsizemain

#1

}
\noindent
% Left column
\hcolumn{\dimexpr \paperheight-\topbarheight-\bottombarheight\relax}{\verticalleftsidebarwidth}%
{\columnbackgroundcolor}{\columnfontcolor}{\columnmarginvertical}{\columnmarginhorizontal}{%
%
\logos{0.25\textwidth}
\begin{minipage}[t]{0.7\textwidth}
\papertitle{\title}
\paperauthor{\author}{\email}
\end{minipage}

\institution{\textwidth}
\vspace*{1 em}

\ifleftcolumns\setlength{\columnsep}{2em}\begin{multicols}{2}\fi
#2
\ifleftcolumns\end{multicols}\fi

}%
\hcolumn{\dimexpr \paperheight-\topbarheight-\bottombarheight\relax}{0.5em}%
{\maincolumnbackgroundcolor}{\columnfontcolor}{\columnmarginvertical}{\dimexpr 0.0\columnmarginhorizontal}{}%
% Right column
\hcolumn{\dimexpr \paperheight-\topbarheight-\bottombarheight\relax}{\dimexpr \textwidth-\verticalleftsidebarwidth-0.5em\relax}%
{\columnbackgroundcolor}{\columnfontcolor}{\columnmarginvertical}{\columnmarginhorizontal}{#3}

\noindent
\vcolumn{\dimexpr \bottombarheight\relax}{
\dimexpr \textwidth\relax
}{\maincolumnbackgroundcolor}{\maincolumnfontcolor}{\dimexpr \footermarginvertical\relax}{\footermarginhorizontal}{


\begin{minipage}[t]{0.1\textwidth}
\qrcode[hyperlink, height=\textwidth]{\urlQRcode}
\end{minipage}%
\begin{minipage}[t]{0.9\textwidth}%
\begin{adjustwidth}{10em}{0em}
{\color{black}\fontsizesmall{
\acknowledgement\par
}}%
\end{adjustwidth}
\end{minipage}

}
}


%% Coloured column command
\newcommand{\vcolumn}[7]{%
\parbox[s][#1][t]{#2}{%
\noindent\colorbox{#3}{%
{\color{#4}\centeredpage{#5}{#6}{#7}}%
}%
}%
}

%% Coloured column command
\newcommand{\hcolumn}[7]{%
\begin{minipage}[t][\dimexpr #1][t]{#2}%
\parbox[s][#1][t]{#2}{%
\noindent\colorbox{#3}{%
\begin{minipage}[t][
\dimexpr 1.0\textheight\relax
][t]{\dimexpr 1.0\textwidth-0\fboxrule-2\fboxsep\relax}
{\leavevmode\color{#4}\centeredpage{#5}{#6}{#7}}%
\end{minipage}}%
}%
\end{minipage}%
}

%% Coloured column command
\newcommand{\column}[7]{%
\begin{minipage}[t][#1][t]{#2}%
\noindent\colorbox{#3}{%
\begin{minipage}[t][
\dimexpr 1.0\textheight\relax
][t]{\dimexpr 1.0\textwidth-0\fboxrule-2\fboxsep\relax}
{\leavevmode\color{#4}\centeredpage{#5}{#6}{#7}}
\end{minipage}}%
\end{minipage}%
}

%% Page with margins command
\newcommand{\centeredpage}[3]{%
\begin{minipage}[c][\textheight][c]{\textwidth}
\begin{center}
\begin{minipage}[t][
\dimexpr 1.0\textheight-2.0#1\relax
][t]{
\dimexpr 1.0\textwidth-2.0#2\relax		
}
{\fontsizestandard #3}
\end{minipage}
\end{center}
\end{minipage}
}

%% Main column command
\newcommand{\maincolumn}[2]{
\vfill{
\fontsizemain

#1

\vspace{1em}
}
\vfill	
\begin{minipage}[t][0.25\textheight][b]{\textwidth}

#2
\end{minipage}
}

%% QR code
\newcommand{\qr}[1]{
\begin{minipage}[c]{0.35\textwidth}
\begin{center}
\textbf{Take a picture} to download the full paper
\end{center}
\qrcode[hyperlink, height=\textwidth]{#1}
\end{minipage}

}

%% Compact QR code
\newcommand{\compactqr}[1]{
\begin{minipage}[t]{0.15\textwidth} 
\begin{center}
The full paper
\end{center}
\qrcode[hyperlink, height=\textwidth]{#1}
\end{minipage}
}

%% Section command
\renewcommand{\section}[1]{

\vspace{2em}{\fontsizesection\selectfont
\textbf{\leavevmode
#1
}}\\[0.5em]

}

%% Subsection command
\renewcommand{\subsection}[1]{

\vspace{.5em}{\fontsizesubsection\selectfont
\textbf{\leavevmode
#1
}}\vspace{.5em}

}

%% Title command
\long\def\papertitle#1{
{\fontsizetitle\textbf{\leavevmode
#1
}\par
}
\vspace*{1 em}

}

%% Author command
\newcommand{\paperauthor}[2]{
{\color{black}\fontsizeauthor
#1

}
{\tt #2}
\\[-1.0em]

}


%% Logos command
\newcommand{\logos}[1]{
\begin{wrapfigure}[0]{r}{#1}
  \includegraphics[height=7.0ex]{img/ufal} 
  \hfill
  \includegraphics[height=7.0ex]{img/cuni} 
\end{wrapfigure}

}


%% Institution command
\newcommand{\institution}[1]{
\begin{minipage}[t]{#1}
{
\color{gray}
\begin{flushleft}
\fontsizesmall{

\vspace{1em}

Charles~University, Faculty~of~Mathematics~and~Physics\\
Institute~of~Formal~and~Applied~Linguistics\\ 
Prague, Czech~Republic

}
\end{flushleft}

}
\end{minipage}

}
