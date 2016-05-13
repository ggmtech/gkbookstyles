%%Myclass file named gkbookm1.cls %%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{gkbookm1}[2016/05/01 gkbookm1]

%Notes: By default, LaTeX allow '@' characters for control sequences from within package and class files, but not from docs

%% Article options
%\DeclareOption{10pt}{ \PassOptionsToClass{\CurrentOption}{book} }

%% Custom package options
%\DeclareOption{sansserif}{\PassOptionsToPackage{\CurrentOption}{paxcommands} }
%\DeclareOption{neverindent}{\PassOptionsToPackage{\CurrentOption}{paxcommands} }
%to automatically invoke the corresponding options when the class or the package is loaded.

%% Fallback
%\DeclareOption*{ \ClassWarning{myclass}{Unknown option '\CurrentOption'} }
% The *  the starred version lets you handle non-implemented options.

%% Execute default options
%\ExecuteOptions{10pt}
%
%% Process given options
%\ProcessOptions\relax

%% Load base
%\LoadClass[a4paper]{article}
\LoadClass[11pt,twoside,openany,svgnames,x11names]{book}
%% Load additional packages and commands.
%\RequirePackage{custom}

%\ClassWarning will show the corresponding message in the TeX compiler output.
%\LoadClass specifies the unique parent class, if any.
%There are also hooks for classes and packages.  \AtEndOfPackage  and \AtEndOfClass


%\endinput
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



\usepackage[T1]{fontenc}
\usepackage[utf8]{inputenc}
\usepackage{geometry}
\geometry{paperwidth=216mm, paperheight=303mm,left=23mm,right=18mm, %% or inner=23mm, outer=18mm
	      top=23mm, bottom=23mm, headheight=\baselineskip, headsep=7mm, footskip=10mm }

\usepackage{pdfpages}
\graphicspath{{img/}} 
%\usepackage[usenames,dvipsnames,svgnames,table]{xcolor}
%% Concoct some colours of our own
\definecolor[named]{GreenTea}{HTML}{CAE8A2}
\definecolor[named]{MilkTea}{HTML}{C5A16F}
\definecolor{myyellow}{RGB}{242,226,149} %for stickynote

\usepackage{booktabs}
\usepackage{wallpaper}
\usepackage{changepage}
%%%%%%%%%%%%%%%from w2l
\usepackage{array}
\usepackage{supertabular}
\usepackage{hhline}
\makeatletter  \newcommand\arraybslash{\let\\\@arraycr} \makeatother  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage[explicit,clearempty]{titlesec}
\usepackage{fancyhdr}

\usepackage{tikz}
\usetikzlibrary{shapes,positioning}
\usepackage{lipsum}
%\usepackage[ISBN=978-80-85955-35-4]{ean13isbn}
%\usepackage{titlesec}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%for stickynotes
\usepackage{xparse}
\usepackage{punk}
\usetikzlibrary{shadows} %\definecolor{myyellow}{RGB}{242,226,149}
\NewDocumentCommand\StickyNote{O{4cm}mO{5cm}}{
	\begin{tikzpicture}  
	\node[fill=myyellow, drop shadow={shadow xshift=2pt,shadow yshift=-4pt}, inner xsep=7pt, xslant=-0.1, yslant=0.1, inner ysep=10pt  ]{\parbox[t][#1][c]{#3}{#2}};
	\end{tikzpicture}    }
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

\newcommand\chapterillustration{}	             %% Command to hold chapter illustration image
\titleformat{\chapter}{}{}{0pt}{                 %% Define how the chapter title is printed
\ThisULCornerWallPaper{1}{\chapterillustration}  %% Background image at top of page
\tikz[overlay,remember picture]			         %% Draw semi-transparent rectangle across the top
  \fill[LightSalmon1,opacity=.7] (current page.north west) rectangle  ([yshift=-3cm] current page.north east);
  \strictpagecheck\checkoddpage	  %% Check if odd or even page
  %% On odd, "logo" at lower rightcorner;Chapter no near spine edge left);chaptertitle near outer edge (right).
  \ifoddpage{ \ThisLRCornerWallPaper{.05}{img/rightarrow3.png}
              \begin{tikzpicture}[overlay,remember picture]
              \node[anchor=south west,    xshift=20mm,yshift=-30mm,
               font=\sffamily\bfseries\huge] at (current page.north west)  {\chaptername\ \thechapter};
              \node[fill=Sienna!80!black,text=white, font=\Huge\bfseries, 
               inner ysep=12pt, inner xsep=20pt, rounded rectangle,anchor=east,  xshift=-20mm,yshift=-30mm] 
               at (current page.north east) {#1};
              \end{tikzpicture}
  }
  %% On even pages, "logo" at lower leftcorner; Chapter no near outeredge (right); chaptertitle near spineedge(left).
  \else {   \ThisLLCornerWallPaper{0.05}{img/RITESlogo.png} %chapter start image 
             \begin{tikzpicture}[overlay,remember picture]
             \node[anchor=south east,   xshift=-20mm,yshift=-30mm,
              font=\sffamily\bfseries\huge] at (current page.north east)  {\chaptername\ \thechapter};
             \node[fill=Sienna!80!black,text=white, font=\Huge\bfseries,
              inner sep=12pt, inner xsep=20pt, rounded rectangle,anchor=west,    xshift=20mm,yshift=-30mm] 
              at ( current page.north west) {#1};
             \end{tikzpicture}
  }
  \fi
}


%% Define how the chapter title is printed%% Draw a semi-transparent rectangle across the top
\titleformat{name=\chapter,numberless}{}{}{0pt}{
\tikz[overlay,remember picture]
  \fill[LightSalmon1,opacity=.7](current page.north west) rectangle ([yshift=-3cm] current page.north east);
  %% Check %%odd pages, "logo" lowerrightcorner; Chapterno near spineedge(left); chaptertitle outer edge(right).
  \strictpagecheck\checkoddpage 
  \ifoddpage{ \begin{tikzpicture}[overlay,remember picture]
             \node[fill=Sienna!80!black,text=white, font=\Huge\bfseries, 
            inner ysep=12pt, inner xsep=20pt, rounded rectangle,anchor=east, xshift=-20mm,yshift=-30mm] 
             at (current page.north east) {#1};
             \end{tikzpicture}
  }
  \else { %% on evenpages, "logo" at lowerleftcorner; Chapterno near outeredge(right); chaptertitle near spineedge(left).
    \begin{tikzpicture}[overlay,remember picture]
    \node[fill=Sienna!80!black,text=white, font=\Huge\bfseries,
      inner sep=12pt, inner xsep=20pt, rounded rectangle,anchor=west,
      xshift=20mm,yshift=-30mm] at ( current page.north west) {#1};
    \end{tikzpicture}
  }
  \fi
}
\titlespacing*{\chapter}{0pt}{0pt}{135mm}
\titlespacing*{name=\chapter,numberless}{0pt}{0pt}{50mm}

%% Set width of pageno colour box in footer to "99"
\newlength\pagenumwidth
\settowidth{\pagenumwidth}{999}
%% style of colourbox of pageno
\tikzset{pagefooter/.style={anchor=base,font=\sffamily\bfseries\small,
text=white,fill=Sienna!80!black,text centered,text depth=17mm,text width=\pagenumwidth}}


%%%%%%%%%%
%%% Re-define running headers on non-chapter pages
%%%%%%%%%%
\fancypagestyle{headings}{%
  \fancyhf{}   % Clear all headers and footers first
  %% Right headers on odd pages
  \fancyhead[RO]{
    \begin{tikzpicture}[remember picture,overlay] %%% First draw the background rectangles
    \fill[MilkTea!25!white] (current page.north east) rectangle (current page.south west);
    \fill[white, rounded corners] ([xshift=-10mm,yshift=-20mm]current page.north east) rectangle ([xshift=15mm,yshift=17mm]current page.south west);
    \end{tikzpicture}
    %% Then the decorative line and the right mark
    \begin{tikzpicture}[xshift=-.75\baselineskip,yshift=.25\baselineskip,remember picture,    overlay,fill=GreenTea,draw=GreenTea]\fill circle(3pt);\draw[semithick](0,0) -- (current page.west |- 0,0);\end{tikzpicture} \sffamily\itshape\small\nouppercase{\rightmark}
  }
  %% Left headers on even pages
  \fancyhead[LE]{\begin{tikzpicture}[remember picture,overlay]%%% Background rectangles first
                \fill[MilkTea!25!white] (current page.north east) rectangle (current page.south west);
                \fill[white, rounded corners] ([xshift=-15mm,yshift=-20mm]current page.north east) rectangle ([xshift=10mm,yshift=17mm]current page.south west);
                \end{tikzpicture}
    %% Then the right mark and the decorative line
    \sffamily\itshape\small\nouppercase{\leftmark}\ 
    \begin{tikzpicture}[xshift=.5\baselineskip,yshift=.25\baselineskip,remember picture, overlay,fill=GreenTea,draw=GreenTea]\fill (0,0) circle (3pt); \draw[semithick](0,0) -- (current page.east |- 0,0 );\end{tikzpicture}
  }

  %% Rightfooters on odd, leftooters on evenpages, display pagenumber in colour box
  \fancyfoot[RO,LE]{\tikz[baseline]\node[pagefooter]{\thepage};}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
}

% Re-define running headers on chapter pages
\fancypagestyle{plain}{%Clear all headers and footers
 \fancyhf{}  % headerfooter Rightfooters on odd, leftfooters on evenpages, pagenumber in colourbox
  \fancyfoot[RO,LE]{\tikz[baseline]\node[pagefooter]{\thepage};}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
}

\usepackage{hyperref}
\hypersetup{hidelinks,backref=true,pagebackref=true,hyperindex=true,colorlinks=false,breaklinks=true,urlcolor= ocre,bookmarks=true,bookmarksopen=false,pdftitle={Title},pdfauthor={Author}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\endinput  % the class completes

% 