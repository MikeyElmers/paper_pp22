############
### Info ###
############
#
# Project: Pause-internal particles in university lectures
#
# Conference: 18th Phonetik und Phonologie (P&P '22)
#
# Contributors: Mikey Elmers and Jürgen Trouvain
#
# Part 01: Load and clean data
#
# Date: September 21, 2022
#
#-------------------------------------------------------
# load packages
library(dplyr)
library(stringr)

# Load Yale lecture annotations
df_yale_annotations <- read.csv(file = "data/raw/yaleAnnotations.csv", row.names = NULL)
df_yale_summary <- read.csv(file = "data/raw/yaleSummary.csv")

# Load TOEFL lecture annotations
df_toefl_annotations <- read.csv(file = "data/raw/toeflAnnotations.csv", row.names = NULL)
df_toefl_summary <- read.csv(file = "data/raw/toeflSummary.csv")

# since we encountered the "duplicate 'row.names' are not allowed" issue
# removes the row.names column name
colnames(df_yale_annotations) <- colnames(df_yale_annotations)[2:ncol(df_yale_annotations)]
df_yale_annotations <- df_yale_annotations[1:(ncol(df_yale_annotations)-1)]

colnames(df_toefl_annotations) <- colnames(df_toefl_annotations)[2:ncol(df_toefl_annotations)]
df_toefl_annotations <- df_toefl_annotations[1:(ncol(df_toefl_annotations)-1)]

# rename summary data column for the upcoming join (column "name" -> "file)
names(df_yale_summary)[1] <- "file"
names(df_toefl_summary)[1] <- "file"

# join dataframes
df_yale_join <- left_join(df_yale_annotations, df_yale_summary, by = "file")
df_toefl_join <- left_join(df_toefl_annotations, df_toefl_summary, by ="file")

# rename columns in join data frame
# speech rate = number of syllables / total time
# articulation rate = number of syllables / phonation time
names(df_yale_join)[names(df_yale_join)=="dur.s."] <- "dur(s)"
names(df_yale_join)[names(df_yale_join)=="phonationtime.s."] <- "phonationtime(s)"
names(df_yale_join)[names(df_yale_join)=="speechrate.nsyll.dur."] <- "speechrate(nsyll/dur)"
names(df_yale_join)[names(df_yale_join)=="articulation_rate.nsyll.phonationtime."] <- "articulationrate(nsyll/phonationtime)"
names(df_yale_join)[names(df_yale_join)=="ASD.speakingtime.nsyll."] <- "ASD(speakingtime/nsyll)"
names(df_yale_join)[names(df_yale_join)=="tFP.s."] <- "tFP(s)"

names(df_toefl_join)[names(df_toefl_join)=="dur.s."] <- "dur(s)"
names(df_toefl_join)[names(df_toefl_join)=="phonationtime.s."] <- "phonationtime(s)"
names(df_toefl_join)[names(df_toefl_join)=="speechrate.nsyll.dur."] <- "speechrate(nsyll/dur)"
names(df_toefl_join)[names(df_toefl_join)=="articulation_rate.nsyll.phonationtime."] <- "articulationrate(nsyll/phonationtime)"
names(df_toefl_join)[names(df_toefl_join)=="ASD.speakingtime.nsyll."] <- "ASD(speakingtime/nsyll)"
names(df_toefl_join)[names(df_toefl_join)=="tFP.s."] <- "tFP(s)"

# correct misspellings and remove other information
df_yale_join$segment  <- str_replace(df_yale_join$segment, "pau", "sil")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "pau ", "sil")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "silsil", "sil")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "pai", "sil")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "silpau", "sil")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "inh", "in")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "iin", "in")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "inxn", "in")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "iun", "in")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "exh", "ex")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "uhuh", "uh")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "uhm", "um")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "um\\+laughter", "um")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "clsil", "cl")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "uh \\+ other: creaky voicer", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "uh \\+ other (creaky voice)", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "swallowing", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "swallow", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "stutter/pau in between??", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "other:cough", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "other: thraot clear", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "other: thr", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "other: swallow?", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "other: sniffle", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "other: rumble", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "other: lip noises", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "other: glottal acrivity", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "other: glottal acitivity", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "other: gl", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "other: ?", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "oat clearpau", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "cl/other", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "clpau", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "and", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "other: thorat clear", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "other: thoat clear", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "other: glottal activity/creaky voice", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "other: glottal", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "other: creaky", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "other: clear throat", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "other: sniff", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "other: lip smacking", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "other: glottal acitivy", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "other: swallow", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "lip", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "other: creak", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "other: laugh", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "other: creaky voice", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "other: lip smack", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "other: cough", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "gl", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "other: glottal pulse", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "other: glottal activity", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "otheroat clear", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "otherottal activity", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "otherottal pulse", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "othercough", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "otherother smack", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "othercreaky voice", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "otherlaugh", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "othercreak", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "otherother smacking", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "otherottal acitivy", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "othersniff", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "otherclear throat", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "othercreaky", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "otherottal", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "otherottal activity/creaky voice", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "otherthoat clear", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "otherthorat clear", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, " ", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "oat clearsil", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "stutter/sil in between??", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "otherothersmack", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "inother", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "otherothersmacking", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "other/creakyothervoice", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "othery", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "otheruh", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "othersmack", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "othersmacking", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "silother", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "othering", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "other\\?", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "stutter/otherin between\\?\\?", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "uhother\\+ other", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "uhother\\+ other (creaky voice)", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "oatotherclearsil", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "stutter/otherotherbetween\\?\\?", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "uhother\\+otherother", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "uhother\\+otherother (creaky voice)", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "otherother\\(creaky voice\\)", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "otherother\\(creakyothervoice\\)", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "otherother", "other")
df_yale_join$segment  <- str_replace(df_yale_join$segment, "other \\(creaky voice\\)", "other")

df_toefl_join$segment <- str_replace(df_toefl_join$segment, "pau", "sil")
df_toefl_join$segment <- str_replace(df_toefl_join$segment, "uh1", "uh")
df_toefl_join$segment <- str_replace(df_toefl_join$segment, "uhm", "um")
df_toefl_join$segment <- str_replace(df_toefl_join$segment, "other: glottal", "other")

# file evst255_13 has ~315 sec of audio played from a video
# removing the two rows that correspond to this video
# updating the filedur for evst255_13 to account for this removal
df_yale_join <- df_yale_join %>% 
  filter(dur != 5.393 & dur != 309.856)
df_yale_join <- df_yale_join %>% 
  mutate(filedur = replace(filedur, filedur == 1515.061, 1199.812))

# create dataframe that doesn't include non-pause particles (np)
df_yale_pints <- df_yale_join %>%
  filter(segment != "np")

df_toefl_pints <- df_toefl_join %>%
  filter(segment != "np")

# add column for number of pause particles for each file
df_pints_col_yale <- df_yale_pints %>% 
  group_by(file) %>% 
  count(segment) %>% 
  summarize(pints = sum(n)) %>% 
  ungroup()

df_pints_col_toefl <- df_toefl_pints %>% 
  group_by(file) %>% 
  count(segment) %>% 
  summarize(pints = sum(n)) %>% 
  ungroup()

# join pause particles (pints) to dataframe with individual annotations
df_yale_pints <- left_join(df_yale_pints, df_pints_col_yale, by = "file")
df_toefl_pints <- left_join(df_toefl_pints, df_pints_col_toefl, by = "file")

# add column for pints rate
df_yale_pints <- df_yale_pints %>% 
  mutate(pintsrate = pints / filedur)

df_toefl_pints <- df_toefl_pints %>% 
  mutate(pintsrate = pints / filedur)

# add columns for speaker and session
df_yale_pints <- df_yale_pints %>% 
  mutate(speaker = 1, session = "first")

# loop through each row and change hist202 to speaker 2 and hist251 to speaker 3
for (i in 1:nrow(df_yale_pints)){
  if (df_yale_pints$file[[i]] == "evst255_01_20min" | df_yale_pints$file[[i]] == "evst255_13_20min" | df_yale_pints$file[[i]] == "evst255_24_20min"){
    df_yale_pints$speaker[[i]] <- 2
  } else if (df_yale_pints$file[[i]] == "hist202_01_20min" | df_yale_pints$file[[i]] == "hist202_13_20min" |  df_yale_pints$file[[i]] == "hist202_24_20min"){
    df_yale_pints$speaker[[i]] <- 3
  } else if (df_yale_pints$file[[i]] == "hist251_01_20min" | df_yale_pints$file[[i]] == "hist251_13_20min" | df_yale_pints$file[[i]] == "hist251_24_20min"){
    df_yale_pints$speaker[[i]] <- 4
  } else if (df_yale_pints$file[[i]] == "span300_01_20min" | df_yale_pints$file[[i]] == "span300_13_20min" | df_yale_pints$file[[i]] == "span300_24_20min"){
    df_yale_pints$speaker[[i]] <- 5
  }
}

# loop through each row and change 13 to second session
for (i in 1:nrow(df_yale_pints)){
  if (df_yale_pints$file[[i]] == "engl310_13_20min" | df_yale_pints$file[[i]] == "evst255_13_20min" | df_yale_pints$file[[i]] == "hist202_13_20min" | df_yale_pints$file[[i]] == "hist251_13_20min" | df_yale_pints$file[[i]] == "span300_13_20min"){
    df_yale_pints$session[[i]] <- "second"
  }
}

# loop through each row and change 24 to third session
for (i in 1:nrow(df_yale_pints)){
  if (df_yale_pints$file[[i]] == "engl310_24_20min" | df_yale_pints$file[[i]] == "evst255_24_20min" | df_yale_pints$file[[i]] == "hist202_24_20min" | df_yale_pints$file[[i]] == "hist251_24_20min" | df_yale_pints$file[[i]] == "span300_24_20min"){
    df_yale_pints$session[[i]] <- "third"
  }
}

# convert speaker from num to factor and get df_yale_between_lectures summary
df_yale_pints$speaker <- factor(df_yale_pints$speaker)

# write dataframes to "final" subdirectory within the "data" directory
write.csv(df_yale_join, "data/final/yale_all.csv", row.names = FALSE)
write.csv(df_yale_pints, "data/final/yale_pints.csv", row.names = FALSE)
write.csv(df_toefl_join, "data/final/toefl_all.csv", row.names = FALSE)
write.csv(df_toefl_pints, "data/final/toefl_pints.csv", row.names = FALSE)