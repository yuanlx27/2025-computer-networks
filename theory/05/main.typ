#import "@local/sysu-templates:0.2.0": exercise

#show: exercise.with(
  title: "Exercise 5: Control Plane",
  subtitle: "Computer Networks (Theory)",
  student: (name: "Langxi Yuan", id: "23336294"),
)

#page([
  #set align(center + horizon)

  Made with #link("https://typst.app")[Typst].

  Source code available at:

  https://github.com/yuanlx27/2025-computer-networks
])

#let solution(body) = block(inset: 0.5em, width: 100%)[
  *_Solution._* #body
]

= P3

Consider the following network.
With the indicated link costs, use Dijkstra's shortest-path algorithm
to compute the shortest path from $x$ to all network nodes.
Show how the algorithm works by computing a table similar to Table 5.1.

#figure(image(width: 50%, "assets/images/20251124-192231.png")) <fig-1>

#solution[
  See @tab-1.

  #figure(
    caption: [Running Dijkstra's algorithm on given network],
    table(
      columns: 8,
      table.header(
        [*step*], [$N'$], [$D(t), p(t)$], [$D(u), p(u)$],
        [$D(v), p(v)$], [$D(w), p(w)$], [$D(y), p(y)$], [$D(z), p(z)$],
      ),
      [0], [$x$], [$oo$], [$oo$], [$3, x$], [$6, x$], [$6, x$], [$8, x$],
      [1], [$x v$], [$4, v$], [$3, v$], [], [$4, v$], [$6, x$], [$8, x$],
      [2], [$x v u$], [$2, u$], [], [], [$3, u$], [$6, x$], [$8, x$],
      [3], [$x v u t$], [], [], [], [$3, u$], [$6, x$], [$8, x$],
      [3], [$x v u t w$], [], [], [], [], [$6, x$], [$8, x$],
      [3], [$x v u t w y$], [], [], [], [], [], [$8, x$],
      [3], [$x v u t w y z$], [], [], [], [], [], [],
    )
  ) <tab-1>
]

= P7

Consider the network fragment shown below.
$x$ has only two attached neighbors, $w$ and $y$.
$w$ has a minimum-cost path to destination $u$ (not shown) of 5,
and $y$ has a minimum-cost path to $u$ of 6.
The complete paths from $w$ and $y$ to $u$ (and between $w$ and $y$) are not shown.
All link costs in the network have strictly positive integer values.

#figure(image(width: 30%, "assets/images/20251124-192330.png")) <fig-2>

+ Give $x$'s distance vector for destinations $w$, $y$, and $u$.

+ Give a link-cost change for either $c(x, w)$ or $c(x, y)$
  such that $x$ will inform its neighbors of a new minimum-cost path to $u$
  as a result of executing the distance-vector algorithm.

+ Give a link-cost change for either $c(x, w)$ or $c(x, y)$
  such that $x$ will not inform its neighbors of a new minimum-cost path to $u$
  as a result of executing the distance-vector algorithm.

#solution[
  + $d_x(w) = 2, d_x(y) = 4, d_x(u) = 7$.

  + Suppose $c(x, w)$ changes to $delta$.
    If $delta <= 6$, then the cost will become $delta + 5$.
    Otherwise, the minimum-cost path will be via $y$ with cost $5 + 6 = 11$.

    Now suppose $c(x, y)$ changes to $delta$.
    If $delta >= 1$, then the minimum-cost path will remain unchanged.
    Otherwise, the path will be via $y$ with cost $delta + 6$.

  + See above.
]

= P14

Consider the network shown below.
Suppose AS3 and AS2 are running OSPF for their intra-AS routing protocol.
Suppose AS1 and AS4 are running RIP for their intra-AS routing protocol.
Suppose eBGP and iBGP are used for the inter-AS routing protocol.
Initially suppose there is no physical link between AS2 and AS4.

#figure(image(width: 70%, "assets/images/20251124-192436.png")) <fig-3>

+ Router 3c learns about prefix $x$ from which routing protocol: OSPF, RIP, eBGP, or iBGP?

+ Router 3a learns about $x$ from which routing protocol?

+ Router 1c learns about $x$ from which routing protocol?

+ Router 1d learns about $x$ from which routing protocol?

#solution[
  + eBGP.

  + iBGP.

  + eBGP.

  + iBGP.
]

= P16

Consider the following network.
ISP B provides national backbone service to regional ISP A.
ISP C provides national backbone service to regional ISP D.
Each ISP consists of one AS.
B and C peer with each other in two places using BGP.
Consider traffic going from A to D.
B would prefer to hand that traffic over to C on the West Coast
(so that C would have to absorb the cost of carrying the traffic cross-country),
while C would prefer to get the traffic via its East Coast peering point with B
(so that B would have carried the traffic across the country).
What BGP mechanism might C use,
so that B would hand over A-to-D traffic at its East Coast peering point?
To answer this question, you will need to dig into the BGP specification.

#figure(image(width: 60%, "assets/images/20251124-192524.png")) <fig-4>

#solution[
  C may advertise its route to D via its East Coast peering point only.
]

= P18

Consider @fig-5.
B would never forward traffic destined to Y via X based on BGP routing.
But there are some very popular applications for which data packets go to X first and then flow to Y.
Identify one such application, and describe how data packets follow a path not given by BGP routing.

#figure(
  caption: [Figure 5.13 from textbook],
  image(width: 80%, "assets/images/20251124-192640.png"),
) <fig-5>

#solution[
  One such application is Content Delivery Network (CDN).
  In CDN, when a user requests content from a server,
  the request is first routed to a nearby CDN node (X),
  which then forwards the request to the origin server (Y) to fetch the content.
  This routing is based on proximity and load balancing rather than BGP routing paths.
]

= P19

In @fig-5, suppose that there is another stub network V that is a customer of ISP A.
Suppose that B and C have a peering relationship, and A is a customer of both B and C.
Suppose that A would like to have the traffic destined to W to come from B only,
and the traffic destined to V from either B or C.
How should A advertise its routes to B and C?
What AS routes does C receive?

#solution[
  A should advertise the route to W only to B,
  and advertise the route to V to both B and C.
  C receives AS routes: A-V, B-A-V, B-A-W.
]
