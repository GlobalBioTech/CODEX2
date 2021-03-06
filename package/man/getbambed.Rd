\name{getbambed}
\alias{getbambed}
\title{
Get bam file directories, sample names, and exonic positions
}
\description{
Gets bam file directories, sample names from .txt file, and exonic positions 
from .bed file.
}
\usage{
getbambed(bamdir, bedFile, sampname, projectname)
}
\arguments{
    \item{bamdir}{
        Column vector. Each line specifies directory of a bam file. Should be
        in same order as sample names in sampname.}
    \item{bedFile}{
        Path to bed file specifying exonic targets. Is of type character.}
    \item{sampname}{
        Column vector. Each line specifies name of a sample corresponding to
        the bam file. Should be in same order as bam directories in bamdir.}
    \item{projectname}{
        String specifying the name of the project. Data will be saved using this
        as prefix.}
}
\value{
    \item{bamdir}{Bam directories}
    \item{sampname}{Sample names}
    \item{ref}{GRanges object specifying exonic positions}
    \item{projectname}{String specifying the name of the project.}
}
\author{
Yuchao Jiang \email{yuchaoj@email.unc.edu}
}
\seealso{
    \code{\link{getcoverage}}
}
\examples{
library(WES.1KG.WUGSC)
dirPath <- system.file("extdata", package = "WES.1KG.WUGSC")
bamFile <- list.files(dirPath, pattern = '*.bam$')
bamdir <- file.path(dirPath, bamFile)
sampnameFile <- file.path(dirPath, "sampname")
sampname <- as.matrix(read.table(sampnameFile))
bambedObj <- getbambed(bamdir = bamdir, bedFile = file.path(dirPath, 
    "chr22_400_to_500.bed"), sampname = sampname,
    projectname = "CODEX_demo")
bamdir <- bambedObj$bamdir
sampname <- bambedObj$sampname
ref <- bambedObj$ref
projectname <- bambedObj$projectname
chr <- bambedObj$chr
}
\keyword{ package }