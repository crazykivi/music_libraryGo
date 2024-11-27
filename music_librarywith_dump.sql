--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: songs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.songs (
    id integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    "group" text,
    song text,
    release_date text,
    text text,
    link text
);


ALTER TABLE public.songs OWNER TO postgres;

--
-- Name: songs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.songs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.songs_id_seq OWNER TO postgres;

--
-- Name: songs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.songs_id_seq OWNED BY public.songs.id;


--
-- Name: songs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs ALTER COLUMN id SET DEFAULT nextval('public.songs_id_seq'::regclass);


--
-- Data for Name: songs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.songs (id, created_at, updated_at, deleted_at, "group", song, release_date, text, link) FROM stdin;
6	2024-11-27 11:23:02.8483+03	2024-11-27 11:23:02.8483+03	\N	Muse	Supermassive Black Hole	29 May 2008, 13:21	"Supermassive Black Hole" is the first single from Black Holes and Revelations, released on 19 June 2006. Its B-side is Crying Shame. The song has been available online since 9 May following a radio premiere the previous day. The single reached #4 in the UK Singles Chart, making it the highest charting single by the band to date. The track was mixed at Townhouse Studios, London. It was released as the third U.S. single on April 23, 2007.\n\nInfluences\n\nThe song showcases the album's experimentation with other genres. "It's the most different to anything we've ever done," Matthew Bellamy told French magazine Rock Mag on 3 March 2006, "We've had some Belgian influences: Millionaire, dEUS, Evil Superstars, Soulwax... These groups were the first to mix R&B rhythms with alternative guitar. We've added a bit of Prince and Kanye West. The drumbeat isn't rocky, with Rage Against the Machine riffs underneath. We’ve mixed a lot of things in this track, with a bit of electronica; it’s different, slow, quite funky."\n\nSpeaking about the album with NME, Bellamy said, "I was going out dancing in clubs around New York. That helped create tracks like "Supermassive Black Hole". Franz Ferdinand would have done it very well, with that dance type beat going on mixed with alternative guitar and I've always wanted to find that."\n\nThe different style has met mixed reactions, and resulted in numerous comparisons, often tongue-in-cheek, of the main riff to those of Cameo's 1986 single Word Up! and Britney Spears' 2004 Do Somethin'.\n\nMusic video\n\nThe single's accompanying promotional video shows the band playing in a small furniture shop, clad in masks. This is intercut with images of dancers in Zentai suits which are then unzipped at the end to reveal beings made of space. The video was shot by Floria Sigismondi, who is also known for directing music videos for bands such as Marilyn Manson, The White Stripes, Interpol and The Cure.\n\nRemixes and covers\n\nThe "Phones Control Voltage mix" of the song was released as the B-side on the vinyl single of Starlight. On the game FIFA 07 there was also an alternative version of the song, which features slightly different guitar and vocals to the original.\n\nThe song was covered by English Progressive metal band Threshold on the limited edition digipak of their 2007 album Dead Reckoning.\n\nChart performance\n\nThe song has been one of their most successful. It gave them their highest singles chart entry, selling 24,104 in its first week (downloads and physical). In total it has sold over 85,000 and was the 84th best selling song of 2006 in the UK.\n\nThe song went for adds on US radio at the end of April 2007. Its early supporters were S021 (Sirius Satellite Radio), KITS (San Francisco), and WFNX (Boston). By mid-May, many stations, including WBTZ (Burlington, Vermont), KJEE (Santa Barbara), S021, and WFNX, were supporting it. The song reached #6 on the US Modern Rock Tracks chart, making it the second highest charting Muse single in the US behind "Starlight". By early June, it was supported by 41 US alternative rock stations and also grew to receive major support from WEQX (Albany, New York) and WHTG (Monmouth/Ocean, New Jersey). By late July, support for the song had spread to 63 US alternative rock stations, with this number rising to 72 by mid-August.\n\nThis song was made available as downloadable content for Guitar Hero 3. This song was featured in the 2008 movie, 'Twilight' based on the books by Stephanie Meyer. It is also available on the widely popular soundtrack for that movie. <a href="http://www.last.fm/music/Muse/_/Supermassive+Black+Hole">Read more on Last.fm</a>. User-contributed text is available under the Creative Commons By-SA License; additional terms may apply.	https://www.last.fm/music/Muse/_/Supermassive+Black+Hole
7	2024-11-27 11:23:47.248048+03	2024-11-27 11:23:47.248048+03	\N	Gorillaz	Feel Good Inc.	17 Mar 2009, 18:22	"Feel Good Inc." is a song by British virtual band Gorillaz, featuring American hip-hop group De La Soul. The song was released as the lead single from the band's second studio album "Demon Days" on 9 May 2005. The single peaked at No. 2 in the United Kingdom and Europe, and No. 14 in the United States. "Feel Good Inc." made the US Billboard year-end top songs chart in 2005 and 2006. It also topped Billboard's Alternative Songs chart in the U.S. for eight consecutive weeks, a first for the band. This is the only song in Damon Albarn's career to reach the top 40 on the Billboard Hot 100. It peaked in the top 10 in 17 countries, reaching No. 1 in Spain and Greece. It surpassed "Clint Eastwood" to become Gorillaz's most successful single worldwide. "Feel Good Inc." has been certified platinum in Australia and double-platinum in the United Kingdom.\n\nThe song was listed in Pitchfork Media and Rolling Stone's Best Songs of the 2000s. It was nominated for three Grammys at the 2006 Grammy Awards, including Record of the Year, but winning for Best Pop Collaboration. Popdose ranked it 26th on their list of 100 best songs of the decade.\n\nMusic video\nThe main themes of the video are intellectual freedom and the media's dumbing down of mass culture.\n\nAt the beginning of the video, the camera rises up to the top of the Feel Good Inc. tower, and a sample of the Spacemonkeyz dub of "Clint Eastwood", entitled "A Fistful of Peanuts", can be heard. The camera focuses into the tower, where 2-D yearns for the freedom to join Noodle on her floating island. The characters lying on the floor represent those who have already been "dumbed down", while the band members are the ones who have awakened. 2-D is trying to wake all the people from their half-dead state by yelling at them through his megaphone, in the style of a political activist. The floating island is chased by ominous helicopters, which closely resemble Korean War era Bell H-13s, monitoring the behaviour inside and ensuring that no one escapes. It is unclear whether they are preventing Noodle's escape or are chasing her away. Back in the tower, De La Soul appear as larger-than life, seemingly omnipotent images on surrounding television screens, laughing at the Gorillaz band members. Their taunting drives 2-D into a wild, hypnotic frenzy as he tries to resist the urge to be dumbed down. At the end of the video, 2-D, beaten by his surroundings, returns to the state he was in when the video began, repeating the words "Feel good" until the video finally ends, in an exact reversal of the intro. The repetition of "Feel good" represents that 2-D is convincing himself that everything is OK (as if he is brainwashing himself to believe it), instead of facing the harsh truth of the situation. The music video for "El Mañana" is a continuation of this video, depicting two helicopter gunships catching up to Noodle's floating windmill island and attacking it.\n\nJamie Hewlett said in an interview that the inspiration for some scenes in the video came from Hayao Miyazaki; specifically, the windmill-powered landmass, which has been compared to that of Miyazaki's "Castle in the Sky".\n\nUsage in media\nThe track was included in the respective soundtracks of SingStar Pop, Dance Dance Revolution Hottest Party 3, DJ Hero, Guitar Hero 5, Fantasia: Music Evolved, Grand Theft Auto V, and Watch Dogs: Legion; the single has also been included as downloadable content for the soundtracks of Rock Band and SingStar. Additionally, the track was utilized in one of Apple's "silhouette style" iPod television advertisements. <a href="http://www.last.fm/music/Gorillaz/_/Feel+Good+Inc.">Read more on Last.fm</a>. User-contributed text is available under the Creative Commons By-SA License; additional terms may apply.	https://www.last.fm/music/Gorillaz/_/Feel+Good+Inc.
8	2024-11-27 11:24:01.532679+03	2024-11-27 11:24:01.532679+03	\N	Kanye West	Stronger	24 Oct 2008, 21:52	"Stronger" is the second single from Kanye West's album Graduation. The single was first released digitally on July 31, 2007. Stronger features a prominent sample from the song Harder, Better, Faster, Stronger by the French house music duo Daft Punk, who received songwriter credits (along with original "Cola Bottle Baby" songwriter Edwin Birdsong, who Daft Punk themselves sampled) and had their costumes appear in the music video, which was co-directed by West and Hype Williams.\n\nAccording to an interview with Def Jam president (at the time) Jay-Z, West obsessed over the production and mixing of the track, having it mixed 75 times, as he could not seem to get the kick drum to sound precisely the way that he wanted it to, amongst other issues. West reportedly recorded over fifty versions of the track.\n\nThe song topped the charts in the United States and was eventually certified Diamond (10x platinum) by the RIAA in 2021. The song won a Grammy Award for Best Rap Solo Performance at the 50th Grammy Awards on February 10, 2008, where West performed the song with Daft Punk as a surprise guest in what became their first televised live performance in their career. The song has since been included on Rolling Stone magazine's '500 Greatest Albums of All Time' list (at #500). The track has also since been credited with not only encouraging other hip-hop artists to incorporate house and electronica elements into their music, but also with playing a part in the revival of disco and electro-infused music in the late 2000s. The song also brought Daft Punk to prominence in the United States; Rolling Stone credited it with "the beginning of the group's path to mainstream success." <a href="http://www.last.fm/music/Kanye+West/_/Stronger">Read more on Last.fm</a>. User-contributed text is available under the Creative Commons By-SA License; additional terms may apply.	https://www.last.fm/music/Kanye+West/_/Stronger
9	2024-11-27 11:24:12.552107+03	2024-11-27 11:24:12.552107+03	\N	Gorillaz	Clint Eastwood	29 Dec 2008, 18:51	Featuring the lyrical stylings of Del Tha Funkee Homosapien. According to the Clint Eastwood Songfacts, the reason the song is called Clint Eastwood is because of the strange harmonica-like instrument (known as a Melodica) used in the background. The same instrument was used in Eastwood's movie A Fistful of Dollars. <a href="http://www.last.fm/music/Gorillaz/_/Clint+Eastwood">Read more on Last.fm</a>. User-contributed text is available under the Creative Commons By-SA License; additional terms may apply.	https://www.last.fm/music/Gorillaz/_/Clint+Eastwood
10	2024-11-27 11:25:09.447904+03	2024-11-27 11:25:09.447904+03	\N	Avicii	Wake Me Up	06 Oct 2013, 21:02	"Wake Me Up" is a song by Swedish DJ and music producer Avicii, which features uncredited vocals from American soul singer Aloe Blacc and acoustic guitar from Incubus' Mike Einziger. It was released in June 2013 as the first single from Avicii's full-length debut studio album, True, which was released on 17 September 2013.\n\nAvicii introduced "Wake Me Up" for the first time live on stage at the Ultra Music Festival in Miami. The experimental rendering (it was accompanied by a live band with instruments and vocalists, including Aloe Blacc) reportedly confused and angered a section of the electronic dance festival community. Subsequently however, Avicii achieved critical and commercial success with the release of the single worldwide. "Wake Me Up" peaked at number one in much of Europe and charted well in all of the English-speaking world. The song has been described as a "summer anthem" by Variance Magazine and, throughout the 2013 festival season, Avicii included it as part of the opening or closing sequence of his sets at EDC Las Vegas, EDC London, Tomorrowland, Creamfields, Electric Zoo and iTunes Festival. In the United States "Wake Me Up!" managed to peak at number four on the Billboard Hot 100. <a href="http://www.last.fm/music/Avicii/_/Wake+Me+Up">Read more on Last.fm</a>. User-contributed text is available under the Creative Commons By-SA License; additional terms may apply.	https://www.last.fm/music/Avicii/_/Wake+Me+Up
11	2024-11-27 11:25:47.304918+03	2024-11-27 11:25:47.304918+03	\N	Daft Punk	Aerodynamic	09 May 2010, 03:45	"Aerodynamic" is an instrumental track by Daft Punk featuring a prominent guitar solo. The track was released on March 28, 2001 as the second single from the Discovery album.\n\nGuy-Manuel de Homem-Christo once described the Discovery album as "A mix between the past and the future, maybe the present." Thomas Bangalter also elaborated in a 2001 interview that "A lot of house music today just uses samples from disco records of the '70s and '80s... While we might have some disco influences, we decided to go further and bring in all the elements of music that we liked as children, whether it's disco, electro, heavy metal, rock, or classical."\n\nThis is reflected in the structure of "Aerodynamic", which is said to build up a funk groove, halt for a solo consisting of "metallic, two-hand tapping on electric guitar", combining the two styles and ending with a separate "spacier" electronic segment. The solo elements were described playfully as "impossible, ridiculous Yngwie guitar arpeggios", which reflect the fast arpeggiation common with violin parts in classical music. Bangalter acknowledged that "Some people might think that the guitar solos on 'Aerodynamic' are in bad taste, but for us, it's all about being true to ourselves and not caring what other people would think. We really tried to include most of the things we liked as kids, and bring that sense of fun to it."\n\nThe "Aerodynamic" single contained a B-side remix titled "Aerodynamite". Another remix of "Aerodynamic" features Detroit-based hip hop group Slum Village. The creation of the Slum Village remix resulted after Slum Village used an uncredited sample of Thomas Bangalter's "Extra Dry" in their song "Raise It Up". Instead of asking for compensation for using the sample, Pedro Winter suggested to Daft Punk that they ask Slum Village to remix one of their tracks.\n\nBoth "Aerodynamite" and the Slum Village remix were later included in the album Daft Club, which contains an additional remix by Daft Punk featuring elements of "One More Time". A live version of "Aerodynamic" coupled with "One More Time" is featured in the album Alive 2007. "Aerodynamic" was later sampled for the Wiley song "Summertime" from the album See Clear Now. <a href="http://www.last.fm/music/Daft+Punk/_/Aerodynamic">Read more on Last.fm</a>. User-contributed text is available under the Creative Commons By-SA License; additional terms may apply.	https://www.last.fm/music/Daft+Punk/_/Aerodynamic
\.


--
-- Name: songs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.songs_id_seq', 11, true);


--
-- Name: songs songs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs
    ADD CONSTRAINT songs_pkey PRIMARY KEY (id);


--
-- Name: idx_songs_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_songs_deleted_at ON public.songs USING btree (deleted_at);


--
-- PostgreSQL database dump complete
--

