#let title = "Assignment 2"
#let subtitle = "Computer Networks (Theory)"
#let student = (name: "Langxi Yuan", id: "23336294")

#set document(
  title: title,
  author: student.name,
)

#set enum(numbering: "a.")

#set par(justify: true)

#show link: set text(fill: blue)

#show raw.where(block: true): it => block(fill: luma(90%), inset: 0.2em, outset: 0.2em, radius: 0.2em, it)
#show raw.where(block: false): it => box(fill: luma(90%), inset: (x: 0.2em), outset: (y: 0.2em), radius: 0.2em, it)

#let solution(body) = block(inset: 0.5em)[
  *_Solution._* #body
]

#page({
  set align(center)

  text(size: 3em, weight: "bold", title)

  v(0em)
  
  text(size: 2em, weight: "bold", subtitle)

  v(9em)

  text(size: 1.5em, student.name)

  v(0em)

  text(size: 1.5em, student.id)
})
  
= P4

+ The URL is http://gaia.cs.umass.edu/cs453/index.html.
  The `Host` line contains the server's name and the `GET` line contains the file's name.

+ `HTTP 1.1`, as shown in the `GET` line.

+ Persistent connection, indicated by `Connection: keep-alive`.

+ Not specified.

+ Netscape 7.2 running on Windows XP, specified in the `User-Agent` line.
  The browser type (User-Agent) is sent so that the server can customize the content for different browsers.

= P7

Time to obtain IP address: $"RTT"_1 + "RTT"_2 + ... + "RTT"_n$.

Time to initiate TCP connection: $"RTT"_0$.

Time to send HTTP request and receive the first byte of HTTP response: $"RTT"_0$.

Transmission time: $0.002 times "RTT"_0$.

Total response time: $2.002 times "RTT"_0 + "RTT"_1 + "RTT"_2 + ... + "RTT"_n$.

= P8

+ $"RTT"_1 + ... + "RTT"_n + "RTT"_0 + "RTT"_0 + 9 dot 2 "RTT"_0 = (n + 20) "RTT"$.

+ $"RTT"_1 + ... + "RTT"_n + "RTT"_0 + "RTT"_0 + ceil.l 9 / 6 ceil.r dot 2 "RTT"_0 = (n + 6) "RTT"_0$.

+ #enum(
    [
      Without pipelining: $"RTT"_1 + ... + "RTT"_n + "RTT"_0 + "RTT"_0 + 9 dot "RTT"_0 = (n + 11) "RTT"_0$;
    ],
    [
      With pipelining: $"RTT"_1 + ... + "RTT"_n + "RTT"_0 + "RTT"_0 + "RTT"_0 = (n + 3) "RTT"_0$.
    ],
    numbering: "1)",
  )

= P15

The `MAIL FROM:` in SMTP is a message that indicates the sender of the email. The `From:` in the mail is not an SMTP message, but a line in the body of the message.

= P18

#solution[
  + A _whois_ database is a database that stores an Internet resource's registered users or assignees.

  + See @fig-1.

    #figure(
      caption: "whois query results",
      table(
        columns: 3,
        table.header([*whois database*], [*domain name*], [*DNS server*]),
        "who.is", "archlinux.org", "helium.ns.hetzner.de",
        "www.whois.com", "nixos.org", "ns-161-c.gandi.net",
      )
    ) <fig-1>

  + 
]

= P23

= P24

= P26
