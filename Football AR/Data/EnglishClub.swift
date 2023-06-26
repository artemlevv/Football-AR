//
//  EnglishClub.swift
//  Football AR
//
//  Created by ARTEM on 25.06.2023.
//

import Foundation

enum EnglishClub: String{
    case Arsenal = "Arsenal"
    case AstonVilla = "Aston Villa"
    case Brentford = "Brentford"
    case Brighton = "Brighton"
    case Burnley = "Burnley"
    case Chelsea = "Chelsea"
    case CrystalPalace = "Crystal Palace"
    case Everton = "Everton"
    case Fulham = "Fulham"
    case LeedsUnited = "Leeds United"
    case LeicesterCity = "Leicester City"
    case Liverpool = "Liverpool"
    case ManchesterCity = "Manchester City"
    case ManchesterUnited = "Manchester United"
    case Newcastle = "Newcastle"
    case NorwichCity = "Norwich City"
    case NottinghamForest = "Nottingham Forest"
    case Southampton = "Southampton"
    case Tottenham = "Tottenham"
    case Watford = "Watford"
    case WestHam = "West Ham"
    case Wolverhampton = "Wolverhampton"
    case UnknownClub = "Unknown Club"
    
    init?(clubName: String) {
           if let club = EnglishClub(rawValue: clubName) {
               self = club
           } else {
               return nil
        }
    }
    var clubID: String{
        switch self{
        case .Liverpool:
            return "64"
        case .ManchesterCity:
            return "65"
        case .Chelsea:
            return "61"
        case .LeicesterCity:
            return "338"
        case .ManchesterUnited:
            return "66"
        case .Arsenal:
            return "57"
        case .Tottenham:
            return "73"
        case .WestHam:
            return "563"
        case .Wolverhampton:
            return "76"
        case .Brighton:
            return "397"
        case .Brentford:
            return "402"
        case .Newcastle:
            return "67"
        case .CrystalPalace:
            return "354"
        case .AstonVilla:
            return "58"
        case .Southampton:
            return "340"
        case .Everton:
            return "62"
        case .LeedsUnited:
            return "341"
        case .Burnley:
            return "328"
        case .Watford:
            return "346"
        case .NorwichCity:
            return "68"
        case .Fulham:
            return "63"
        case .NottinghamForest:
            return "351"
        case .UnknownClub:
            return ""
        }
    }
    
    var description: String {
            switch self {
            case .Arsenal:
                return "Arsenal Football Club is an English professional football club based in Islington, London. Arsenal play in the Premier League, the top flight of English football. The club has won 13 league titles (including one unbeaten title), a record 14 FA Cups, two League Cups, 16 FA Community Shields, one European Cup Winners' Cup, and one Inter-Cities Fairs Cup. In terms of trophies won, it is the third-most successful club in English football."
            case .AstonVilla:
                return "Aston Villa Football Club, commonly referred to as Villa, is a professional football club based in Aston, Birmingham, England. The club competes in the Premier League, the top tier of the English football league system. Founded in 1874, they have played at their home ground, Villa Park, since 1897. Aston Villa is one of the oldest and most successful clubs in England, having won the Football League First Division seven times, the FA Cup seven times, the League Cup five times, and the European Cup and European (UEFA) Super Cup once."
            case .Brentford:
                return "Brentford Football Club is a professional football club in Brentford, West London, England which competes in the Premier League, the highest tier of English football. Nicknamed 'The Bees', the club was founded in 1889 and played home matches at Griffin Park from 1904 before moving to Gtech Community Stadium in 2020. Their main rivals are fellow West London-based clubs Fulham and Queens Park Rangers."
            case .Brighton:
                return "Brighton & Hove Albion Football Club commonly referred to simply as Brighton, is an English professional football club based in the city of Brighton and Hove. They compete in the Premier League, the top tier of the English football league system. The club's home ground is the 31,800-capacity Falmer Stadium in Falmer, in the north east of Brighton."
            case .Chelsea:
                return "Chelsea Football Club is an English professional football club based in Fulham, West London. Founded in 1905, they play their home games at Stamford Bridge. The club competes in the Premier League, the top division of English football. They won their first major honour, the League championship, in 1955. The club won the FA Cup for the first time in 1970, their first European honour, the Cup Winners' Cup, in 1971, and became the third English club to win the Club World Cup in 2022."
            case .CrystalPalace:
                return "Crystal Palace Football Club, commonly referred to as Palace, is a professional football club based in Selhurst in the Borough of Croydon, South London, England, which competes in the Premier League, the highest level of English football. They were founded in 1861 at the famous Crystal Palace Exhibition building and initially played inside its grounds using the FA Cup Final stadium for their home games until 1915, when they were forced to leave due to the outbreak of the First World War. In 1924, they moved to their current home at Selhurst Park."
            case .Everton:
                return "Everton Football Club  is an English professional association football club based in Liverpool that competes in the Premier League, the top tier of English football. The club was a founder member of the Football League in 1888, and has, as of May 2023, competed in the top division for a record 120 seasons, having missed only four top-flight seasons (1930–31, 1951–52, 1952–53, and 1953–54). Everton is the club with the second-longest continuous presence in English top-flight football and ranks third in the all-time points rankings. The club has won nine league titles, five FA Cups, one European Cup Winners' Cup and nine Charity Shields."
            case .Fulham:
                return "Fulham Football Club is a professional football club based in Fulham, Greater London, England. The team competes in the Premier League, the top level of the English football league system. They have played home games at Craven Cottage since 1896, other than a two-year period spent at Loftus Road whilst Craven Cottage underwent redevelopments that were completed in 2004. They contest West London derby rivalries with Chelsea, Queens Park Rangers and Brentford. The club adopted a white shirt and black shorts as its kit in 1903, which has been used ever since."
            case .Liverpool:
                return "Liverpool Football Club commonly known as Liverpool, is an English professional association football club based in Liverpool, Merseyside, England. It is best known for it's men's first team which competes in the Premier League, the top tier of English football. Founded in 1892, the club joined the Football League the following year and has played its home games at Anfield since its formation. Domestically, the club has won 19 League titles, eight FA Cups, a record nine League Cups and 16 FA Community Shields. In international competitions, the club has won six European Cups, three UEFA Cups, four UEFA Super Cups—all English records—and one FIFA Club World Cup."
            case .ManchesterCity:
                return "Manchester City Football Club are an English professional football club based in Manchester that competes in the Premier League, the top flight of English football. Founded in 1880 as St. Mark's (West Gorton), they became Ardwick Association Football Club in 1887 and Manchester City in 1894. The club's home ground is the Etihad Stadium in east Manchester, to which they moved in 2003, having played at Maine Road since 1923. Manchester City adopted their sky blue home shirts in 1894, in the first season with the current name."
            case .ManchesterUnited:
                return "Manchester United Football Club, commonly referred to as Man United (often stylised as Man Utd), or simply United, is a professional football club based in Old Trafford, Greater Manchester, England. The club competes in the Premier League, the top division in the English football league system. Nicknamed the Red Devils, they were founded as Newton Heath LYR Football Club in 1878, but changed their name to Manchester United in 1902. After a spell playing in Clayton, Manchester, the club moved to their current stadium, Old Trafford, in 1910. Manchester United have won a total 67 trophies during their history; a record 20 League titles, 12 FA Cups, six League Cups, and a record 21 FA Community Shields. Additionally, they have won the European Cup/UEFA Champions League three times, and the UEFA Europa League, the UEFA Cup Winners' Cup, the UEFA Super Cup, the Intercontinental Cup and the FIFA Club World Cup once each.[5][6] In 1968, under the management of Matt Busby, 10 years after eight of the club's players were killed in the Munich air disaster, they became the first English club to win the European Cup. Sir Alex Ferguson is the club's longest-serving and most successful manager, winning 38 trophies, including 13 league titles, five FA Cups, and two Champions League titles between 1986 and 2013."
            case .Newcastle:
                return "Newcastle United Football Club, commonly referred to as Newcastle, is an English professional football club based in Newcastle upon Tyne, Tyne and Wear. The club compete in the Premier League, the highest level of the English football league system. The club was founded in 1892 when Newcastle East End absorbed the assets of Newcastle West End to become ‘United’. The team plays its home matches at St. James' Park - one of the country’s most iconic football stadiums. Located in the centre of Newcastle, it currently has a capacity of 52,305. The club has been a member of the Premier League for all but three years of the competition's history, spending 91 seasons in the top flight as of May 2023, and has never dropped below English football's second tier since joining the Football League in 1893."
            case .NottinghamForest:
                return "Nottingham Forest Football Club, often referred to as Forest for short, is a professional football club based in West Bridgford, Nottingham, England. It was founded in 1865; the team have played their home games at the City Ground, on the south bank of the River Trent in Nottingham, since 1898. Forest is one of six English clubs to have won the European Cup (an accolade it shares with Manchester United, Liverpool, Chelsea, Aston Villa and Manchester City), one of four English clubs to have won that trophy multiple times (along with Liverpool, Manchester United and Chelsea), as well as one of two English clubs (the other being Liverpool) to have won the competition back-to-back. Forest has two stars above its club crest to commemorate its two European Cup victories. It is also considered by the EFL as its oldest member club (due to Stoke City's lack of evidence of being founded in 1863), as well as being the oldest club currently competing in the Premier League, the top division of the English football league system."
            case .Tottenham:
                return "Tottenham Hotspur Football Club, commonly referred to as simply Tottenham or Spurs, is a professional football club based in Tottenham, London, England. It competes in the Premier League, the top flight of English football. The team has played its home matches in the 62,850-capacity Tottenham Hotspur Stadium since April 2019, replacing their former home of White Hart Lane, which had been demolished to make way for the new stadium on the same site. In domestic football, Spurs have won two league titles, eight FA Cups, four League Cups, and seven FA Community Shields. In European football, they have won one European Cup Winners' Cup and two UEFA Cups."
            case .WestHam:
                return "West Ham United Football Club is an English professional football club that plays its home matches in Stratford, East London. The club competes in the Premier League, the top tier of English football. The club plays at the London Stadium, having moved from their former home, the Boleyn Ground, in 2016. West Ham have been winners of the FA Cup three times (1964, 1975 and 1980) and runners-up twice (1923 and 2006). The club have reached three major European finals, winning the European Cup Winners' Cup in 1965, finishing runners-up in the same competition in 1976, and winning the second edition of the Europa Conference League in 2023."
            case .Wolverhampton:
                return "Wolverhampton Wanderers Football Club commonly known as Wolves, is a professional football club based in Wolverhampton, England, which competes in the Premier League. The club has played at Molineux Stadium since moving from Dudley Road in 1889. The club's traditional kit consists of old gold shirts and socks with black shorts. Since 1979, the kit has also featured the club's 'wolf's head' logo. Long-standing rivalries exist with other clubs from the West Midlands, the main one being the Black Country derby contested with West Bromwich Albion (albeit this fixture has only actually been contested on two occasions - both in the 2020–21 season - since 2012)."
            case .LeedsUnited:
                return "Leeds United Football Club is a professional football club based in Leeds, West Yorkshire in England. The club play their home matches at Elland Road and compete in the Championship, the second tier of the English football league system. Leeds United have won the League Championship three times, four Second Division titles, the FA Cup once, the EFL Cup once, the Charity Shield twice and the Inter-Cities Fairs Cup twice.  The club has rivalries with Manchester United and Chelsea. The team's traditional kit colours are white shirts, white shorts and white socks. Their badge features the White Rose of York, which is a symbol of Yorkshire."
            case .LeicesterCity:
                return "Leicester City Football Club is a professional association football club based in Leicester, in the East Midlands of England. They play their home matches at the King Power Stadium and compete in the EFL Championship, the second tier of English football. Leicester City were founded in 1884 as Leicester Fosse F.C, playing on a field near Fosse Road. They moved to Filbert Street in 1891, were elected to the Football League in 1894 and adopted the name Leicester City in 1919. They moved to the nearby Walkers Stadium in 2002, which was renamed as the King Power Stadium in 2011. Leicester won the 2015–16 Premier League, becoming one of seven clubs to have won the Premier League since its inception in 1992. The title win was widely considered a 'footballing miracle' and subsequently attracted global attention."
            case .NorwichCity:
                return "Norwich City Football Club (also known as The Canaries or The Yellows) is an English professional football club based in Norwich, Norfolk. Norwich compete in the EFL Championship, the second tier of the English football league system. The club was founded in 1902. Since 1935, Norwich have played their home games at Carrow Road and have a long-standing rivalry with East Anglian rivals Ipswich Town, with whom they have contested the East Anglian derby since 1902. Norwich have won the League Cup twice, in 1962 and 1985. The club's highest ever league finish came in the 1992–93 season when they finished third in the Premier League. Norwich have featured in the UEFA Cup once, in the 1993–94 season, where they were defeated in the third round, but en route became the first English club to defeat German side Bayern Munich at the Olympiastadion in Munich."
            case .Southampton:
                return "Southampton Football Club  is an English professional football club based in Southampton, Hampshire, that compete in the EFL Championship, the second tier of English football. Their home ground since 2001 has been St Mary's Stadium, before which they were based at The Dell. The club play in red and white shirts. They have been nicknamed 'The Saints' because of the club's beginnings as a church football team at St Mary's Church. Southampton share a long-standing South Coast derby rivalry with Portsmouth, in part due to geographic proximity and both cities' respective maritime histories."
            case .Watford:
                return "Watford Football Club is an English professional football club based in Watford, Hertfordshire. They play in the EFL Championship, the second tier of the English football league system. The club’s original foundation is 1881, aligned with that of its antecedent, Watford Rovers, and was established as Watford Football Club in 1898. After finishing the 1914–15 season as Southern League champions under the management of Harry Kent, Watford joined the Football League in 1920. The team played at several grounds in their early history, including what is now West Herts Sports Club, before moving to Vicarage Road in 1922. They have a long-standing rivalry with nearby club Luton Town."
            case .Burnley:
                return "Burnley Football Club  is an English association football club based in Burnley, Lancashire, that competes in the Premier League, the first tier of English football. Founded on 18 May 1882, the club was one of the first to become professional (in 1883), and subsequently put pressure on the Football Association to permit payments to players. The club entered the FA Cup for the first time in 1885–86 and was one of the 12 founder members of the Football League in 1888–89. From the 1950s until the 1970s, under chairman Bob Lord, the club became renowned for its youth policy and scouting system, and was one of the first to set up a purpose-built training ground."
            case .UnknownClub:
                return ""
            }
    }
}
