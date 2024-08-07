## Ultra Chaos
### Shijun Liao
### IES Seminar, University of Edinburgh
### September 21, 2023
In this seminar,  Liao delved into the realms of chaos theory, recognized as one of the 20th century's three major scientific revolutions alongside Einstein's theory of relativity and quantum mechanics. The talk focused on a prevalent belief in the scientific community: despite the inherent instability of chaotic systems' trajectories due to the "butterfly effect," their statistical outcomes should remain stable and reproducible. This notion of reproducibility forms the bedrock of modern scientific methodology.

However,  Liao addressed a growing concern in contemporary research – the "crisis of reproducibility." Numerous experiments increasingly report results that cannot be consistently replicated. To tackle this issue, Liao introduced a novel numerical technique, termed “clean numerical simulation” (CNS), which has led to the discovery of "ultra-chaos." This new concept challenges the existing paradigm; in ultra-chaotic systems, statistics are unstable even to minor disturbances, rendering experimental and numerical results irreproducible, even statistically.

The significance of ultra-chaos extends beyond mere theoretical interest; it highlights a fundamental gap in the current scientific research paradigm that heavily relies on the reproducibility of experimental outcomes. The presentation elucidated the core principles of CNS, defined ultra-chaos, and provided illustrative examples. The talk culminated in proposing several conjectures and open questions, notably the “modified fourth Clay millennium problem,” suggesting a profound shift in the scientific approach to understanding chaotic systems. This exploration of ultra-chaos not only introduces a novel concept but also invites a reevaluation of the fundamental principles of scientific inquiry and experimentation.


## A divide-and-conquer method for analyzing high-dimensional noisy gene expression networks
### Zhou Fang
### ETH Zurich
### October 26, 2023
In this seminar, Zhou presents a new method for analyzing high-dimensional, noisy gene expression networks, developed in collaboration with Dr. A. Gupta, Dr. S. Kumar, and Professor M. Khamash. The focus is on understanding the stochastic dynamics of biological cells, crucial for applications in medicine and industry.

The approach uses stochastic models, specifically continuous-time Markov chains, to represent cellular behavior. These models account for the randomness inherent in biological processes, crucial for accurately depicting cell state transitions and chemical reactions.

The key challenge addressed is the computational difficulty in solving the chemical master equation (CME), a pivotal tool in predicting and inferring cellular dynamics. Traditional methods for solving the CME struggle with high-dimensional systems, a problem known as the curse of dimensionality.

To overcome this, Joe's team introduces a divide-and-conquer strategy that relies on modularization and conditional independence. This novel approach decomposes the system into a 'leader' part and several conditionally independent 'follower' parts. By simulating the leader and separately computing the conditional probabilities of the followers, the method achieves greater scalability and efficiency in high-dimensional scenarios.

Joe also discusses the application of their method to stochastic filtering, used to infer hidden biological states from partial observations, a common challenge in experiments with limited gene tagging capabilities.

The seminar showcases the method's effectiveness through examples, including both linear and nonlinear biological systems. The new approach significantly outperforms traditional methods, particularly in accurately estimating the dynamics of the follower systems.

Concluding, Joe emphasizes the potential of this method in complex biological systems analysis and its successful application in a yeast transcription study. The research is detailed in a paper available on bioRxiv.


## Well distributed occurrences property in infinite words
### Svetlana Puzynina
### One World Seminar on Combinatorics
### November 7, 2023
In this seminar, Svetlana Puzynina discusses "Well Distributed Occurrences in Infinite Words." She begins by defining the concept of well distributed occurrences (WDO) in aperiodic infinite words. This property implies that for any integer \( m \) and any factor \( w \) of the word, the periodic vectors of the prefixes preceding the occurrences of \( w \) cover all possible vectors modulo \( m \).

Puzynina then examines the relevance of this property in the context of pseudorandom number generation, where it can improve the statistical properties of generated sequences. She discusses linear congruential generators and the issue of lattice structures in pseudorandom sequences, explaining how WDO properties can be used to address these concerns.

The talk explores several families of infinite words, including Sturmian words, Arnoux-Rauzy words, and morphic words. Puzynina proves that Sturmian words have the WDO property using a geometric approach based on rotations on a circle. She extends this result to Arnoux-Rauzy words and provides a characterization for morphic words that satisfy the WDO property.

For morphic words, the WDO property is linked to the determinant of the morphism's matrix being \(\pm 1\). This result is shown to hold for binary morphic words and is extended to non-binary morphic words with an additional condition related to return words.

The seminar also touches upon the potential of using words with the WDO property in pseudorandom number generation, discussing how such words can be used to mix multiple generators to create sequences with better statistical properties.

In conclusion, Puzynina raises questions about further research directions. These include exploring the WDO property in non-primitive morphisms and investigating other word properties that could improve pseudorandom number generators. She notes that while some of this recent findings are yet to be published, they indicate promising avenues for improving pseudorandom number generation using the properties of infinite words.


## Scaling methods for stochastic chemical reaction networks
### Lucie Laurence
### Seminar on the Mathematics of Reaction Networks
### November 9, 2023
Lucie Lauerence, a Ph.D. student at INRIA, presented her work on scaling methods for studying stochastic chemical reaction networks, a joint project with Philip Ro. He introduced chemical reaction networks as triplets of finite sets - species, complexes, and reactions - exemplified through graph representation. Stochastic networks were described as continuous-time Markov processes with reaction occurrences causing state changes. The focus was on the commonly used law of mass action kinetics, which introduces varied timescales and potential system explosions.

The seminar highlighted the challenges in demonstrating model stability, defined as returning to an initial state in finite time. Lauerence discussed the utility of Lyapunov's approach in identifying energy functions to indicate decreasing system energy over time. He introduced two stability criteria - Foster's Theorem and Filonov's Criterion. The former requires immediate energy reduction after a system jump, while the latter allows energy decrease over a stipulated time, offering greater flexibility.

Lauerence applied these concepts to a specific cyclic chemical reaction network, illustrating how different initial states affect energy function behavior. The seminar delved into the intricate dynamics of this network, analyzing how the interplay of reactions impacts the system's stability. Using simulations, Lauerence demonstrated the transition behavior, showcasing the fluctuation of molecule quantities over time. This led to discussions on normalizing these changes and establishing convergence to continuous-time Markov jump processes.

In conclusion, Lauerence emphasized the usefulness of scaling analysis in not only proving stability but also in exploring transition behaviors and time scales of energy decrease in stochastic networks. He referenced two articles detailing this work, thanking the audience for their attention to this complex yet fascinating topic.


## Quantitative estimates for the size of an intersection of sparse automatic sets
### Seda Albayrak
### One World Seminar on Combinatorics, University of Calgary
### November 21, 2023
In this seminar, Seda Albayrak from the University of Calgary discusses "Quantitative Estimates on the Size of an Intersection of Sparse Automatic Sets." This research, conducted in collaboration with Jason Bell, explores the intersections of sets defined through automatons and their sparse nature.

Albayrak begins by explaining the concept of an automatic set – a subset of natural numbers represented by a finite state automaton. An automatic set is deemed 'sparse' if its growth rate is polylogarithmically bounded, and 'nonsparse' otherwise. The seminar delves into examples of both sparse and nonsparse automatic sets, illustrating their properties and significance.

A significant part of Albayrak's talk focuses on the intersection of sparse automatic sets, particularly in relation to Cobham's Theorem, which addresses the periodicity of sets that are automatic with respect to multiple, multiplicatively independent bases. Albayrak's main result asserts that the intersection of sparse automatic sets, where the bases of automatons are multiplicatively independent, is finite. She demonstrates this by providing an upper bound on the size of such intersections, derived from the properties of the automata that define these sets.

The seminar also extends these findings to multi-dimensional cases, adapting the concepts to subsets of n-dimensional spaces. In these scenarios, Albayrak shows that the intersection remains finite, with the bound dependent on additional factors like the dimensionality of the space.

Albayrak concludes with a conjecture related to Ouyang's Conjecture in number theory, suggesting that the intersection of a sparse automatic set and a zero-density automatic set remains finite. This conjecture, though not directly solving Ouyang's Conjecture, relates closely to its themes and could have implications in further understanding sparse automatic sets and their intersections.

## Simplicity of inverse semigroup and etale groupoid algebras
### Benjamin Steinberg
### Noncommutative Geometry in NYC
### December 6, 2023
The seminar, led by Professor Benjamin Steinberg from the City College of New York, focused on the simplicity of inverse semigroups and Italian report algebras. Steinberg began by discussing challenges with the lighting in his environment, before diving into the core topic. He collaboratively worked with Nudata Sandbox at the University of Manchester, covering two different papers. Parts of his talk were previously presented in Edinburgh, using some of the same slides.

Steinberg then delved into the concept of inverse semigroups, explaining their foundational elements and unique properties. He used interactive methods, like annotation, to illustrate the concepts, despite some technical challenges with the application. The talk covered various aspects, including the definition of inverse semigroups, their algebraic structure, and their applications in different mathematical fields.

A significant part of the seminar was dedicated to discussing random number generation and its relation to inverse semigroups. Steinberg provided a detailed explanation of pseudorandom number generators and their limitations, highlighting the role of inverse semigroups in improving their statistical properties.

Towards the end of the seminar, Steinberg opened the floor for questions, addressing inquiries about the geometric applications of inverse semigroups and their relationship with group theory. The seminar concluded with discussions on the intersection of graph C*-algebras with C*-algebras of inverse semigroups, showcasing the broad applicability of the topic in various mathematical domains.


## Complexity of Learning and Creating Quantum Systems
### Hsin-Yuan (Robert) Huang
### Workshop on Spacetime and Quantum Information, Caltech
### December 12, 2023
In this seminar, Robert explores the relationship between learning and creating quantum systems. He discusses complexity, a key concept in fields ranging from computer science to physics. Specifically, he focuses on different types of complexity, such as Kolmogorov complexity in algorithmic information theory, circuit complexity in electrical engineering, and computational and sample complexity in computer science and machine learning.

The core of the talk addresses the complexities of learning about quantum systems, essential due to the quantum nature of the universe. Robert examines the fundamental connection between the complexity of learning and the complexity of creating quantum systems. He introduces formal mathematical definitions for these complexities, including quantum circuit complexity in both its exact and approximate forms.

A significant part of the seminar is dedicated to discussing the conjecture that the complexity of creating quantum systems grows linearly over time. Robert elaborates on two key measures of learning complexity: sample complexity and computational complexity. He presents a learning protocol that utilizes scrambling dynamics and measurement to establish that a linear number of measurements is both sufficient and necessary for learning quantum states based on their circuit complexity. Moreover, he demonstrates that computational complexity grows exponentially with circuit complexity, eventually plateauing.

In conclusion, Robert highlights several open questions and future research directions, such as understanding the role of physical concepts like geometry and entanglement in learning complexity, and the exploration of phase transitions in learning complexity in relation to quantum systems.


## New Non-Perturbative Results from a Random Matrix Model of N=2 JT Supergravity
### Clifford V. Johnson
### Workshop on Spacetime and Quantum Information, University of California, Santa Barbara
### December 13, 2023
In this seminar, Clifford Johnson presents this work on "Non-Perturbative Results in a Random Matrix Model." He discusses the significance of solvable models in quantum gravity and explores how random matrix models can provide insights into various quantum gravity questions, such as the emergence of geometry and the nature of quantum discreteness.

Johnson emphasizes the need for non-perturbative studies to fully understand the capabilities of random matrix models. He argues that while perturbative approaches have yielded significant insights, they do not capture the complete picture. To illustrate this, he delves into the details of constructing and analyzing random matrix models, particularly focusing on their non-perturbative aspects.

A key part of this talk involves the use of orthogonal polynomials in the study of random matrix models. He explains how these polynomials can be used to organize the Feynman diagrams in terms of surfaces and how their study leads to understanding the universal physics in a double scaling limit.

Johnson also discusses the application of this methods to n=2 JT (Jackiw-Teitelboim) gravity. He highlights the challenges and successes in constructing a non-perturbative random matrix model for n=2 JT gravity, demonstrating how the model can be built from basic models and solved numerically to reveal non-perturbative effects.

Towards the end, Johnson addresses the importance of non-perturbative methods in capturing the discrete nature of quantum gravity, which he argues is not visible in perturbative approaches. He concludes with thoughts on the potential generalization of these methods to higher-dimensional gravity models, suggesting that there is much more to explore in this area.