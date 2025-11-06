#import "utils/general-utils.typ": * 
#import "template/styles.typ": *

#set document(title: "Thesis Proposal") // Note: this title is visible in the PDF viewer

#show: styles

#set align(center)
#text(
  heading("A Master Thesis Proposal", numbering: none, outlined: false), size: 1.15em
)
#v(14pt)

#text("MSc Computer Science
Priyanka Ahuja
November 2025")
\


#line(length: 100%, stroke: gray)

#set align(left)
#set heading(numbering: "1.")


= Introduction

Electroencephalographic data is a very high dimensional, complex and noisy time-series record of neural activity. These signals contain meaningful information about how the brain states change over time, but their complexity make it a challenge to analyze and visualize them directly.The information contained within this massive dataset is encoded in the continuous temporal flow of brain states. Such high dimensionality and complexity including the various features present a fundamental barrier to robust visualization and analysis. To study and identify the patterns of neural activity, also known as manifolds, dimensionality reduction methods are used to simplify the data while keeping the important information about how brain states evolve over time.
\
More recent approaches such as PHATE (Potential of Heat-diffusion for Affinity-based Transition Embedding), T-PHATE (Temporal-PHATE), and CEBRA.AI (Contrastive Embedding for Behavior and Representation Analysis) are designed to better preserve temporal and structural relationships in neural data.
In this research, we will these compare advanced, time-aware algorithms along with standard dimensionality reduction approaches like PCA (Principal Component Analysis) and t-SNE. The goal is to identify which method can provide the best accurate data of brain states #cite(<Manifold>).

== Motivation
Traditional dimensionality reduction methods like PCA, t-SNE, and UMAP, have limitations when used for EEG data visualisation. EEG is a time-series data set in where the most important information lies in the continuous trajectory of brain states. These methods neglect the time-series information, resulting in disconnected irrelevant clusters.
PHATE, T-PHATE, and CEBRA.AI are examples of recent advancements that concentrate on time-focused algorithms. These techniques seek to reveal transitions and temporal patterns of brain activity, such as the existence of ring or point attractors in brain states that are otherwise not revealed in traditional methods.
\


== Related work

- The paper "Visualizing structure and transitions in high-dimensional biological data" #cite(<PHATE>) introduces PHATE, a dimensionality reduction technique designed for high-dimensional data where the preservation of continuous developmental trajectories is important.PHATE's methodology is based on diffusion geometry to focus on global structure and effectively de-noise the data. The process first captures local similarities, it then uses a diffusion process to transform the local similarities into probabilities that measure the probability of transitioning from one data point to another in a single step transition probabilities, which smooths out noise and reveals the continuous path (geodesic distance) along the manifold. The final embedding is then based on  potential distance information into low dimensions for visualization.The performance was validated based on DeMAP metric. The paper concludes that PHATE captures the true structure of high-dimensional data more accurately than traditional visualization methods like t-SNE, UMAP.
\
- The paper "Multi-view manifold learning of human brain-state trajectories" by Busch et al. (2023) #cite(<TPHATE>)introduces T-PHATE as a technique in manifold learning for analyzing time-series brain activity data, such as fMRI. It uses a approach of dual-view diffusion operator to embed time based data in a low-dimensional space.  T-PHATE is built on PHATE but has a temporal view by data's autocorrelation structure indicating how a signal is related to its past timestamp. It calculates the similarity between local time points in order to link nearby data points along the temporal sequence.The paper concludes that TPHATE shows ordered brain states trajectories by preserving the temporal continuity which are otherwise lost.

\

- The paper "Learnable latent embeddings for joint behavioural and neural analysis" by Schneider et al. (2023) #cite(<cebra>)introduces CEBRA, self-supervised learning algorithm. The algorithm defines "positive" (similar) and "negative" (dissimilar) points between neural activity points based on time or behavioral labels. Then, deep neural network is trained using a contrastive loss function. The network learns the low-dimensional embedding by continuously minimizing the loss function, pulling"positive" pairs closer together and "negative" pairs farther apart. The paper concludes that CEBRA produces consistent embeddings, meaning the low-dimensional map is stable and reliable and the resulting manifolds exhibited high decoding accuracy for both time and behavioral labels.

= Planned Project
== Research Questions

- What is the best way to assess dimensionality reduction methods?
- Which dimensionality reduction method among PCA, t-SNE, UMAP, PHATE, T-PHATE, and CEBRA.AI produces the most accurate low-dimensional manifold for revealing the temporal state of EEG data?
      \
      Novelty of work:
    Test the two most advanced, time-focused algorithms T-PHATE and CEBRA.AI against standard, time-ignoring methods like t-SNE, UMAP

== Goals
To assess data simulation using the UnfoldSim package in Julia and use python packages to implement PHATE, TPHATE and CEBRA.AI

=== Main Goals <mainGoals>
#v(0.3em)
#set enum(numbering: "A.")


#[
  #show figure: set align(left) 
   + #goal("Simulate EEG data using UnfoldSim.jl") <goal1>  
  + #goal("Implement visualisation techniques in Python") <goal1>  
  
  + #goal("To understand and compare the methods based on the ability to  preserve data") <goal1>  
  + #goal("To discover hidden patterns in each method and state which method provides the clear low dimensional visualisation.") <goal2>
  + #goal("Documenting the steps and procedure for easy understanding.") <goal2>
]


/*=== Stretch Goals <stretchGoals>
#v(0.3em)
#set enum(numbering: "A.", start: 3) // continue the numbering from where the main goals left off. Adjust `start` depending on how many main goals you have.
#[
  #show figure: set align(left) 
  + #goal("I'll do another thesis if there is time.") <goal3>
  + #goal("Maybe another one as well.") <goal4>
] */

== Approach <approach>
*Phase 1 *
- Data Simulation: Use UnfoldSim.jl, a Julia package for simulating  timeseries data #cite(<unfoldsim>) focusing on EEG and event-related potentials (ERPs). 

\

*Phase 2*
 - Implementation: We will use dual-approach, Julia for data simulation along with python for its libraries to perform analysis and run algorithms: PCA, t-SNE, UMAP, PHATE, TPHATE and Cebra.AI and validate the low dimensional maps by using metrics on how accurate the maps are.
- Different maps might have different metrics, understand the the performance across different methods to identify the best method for preserving temporal structure in EEG data. 
- Understand and assess metrics like Spearman Rank Correlation and DeMap

*Phase 3*
- Compare all low dimensional maps to identify which method gives the most relevant information.

*Phase 4*
- Document the process and their visualization maps along with the findings for EEG data. 


\

= Plan

- Literature review and implementation will be carried out simultaneously to understand the EEG data as techniques like PHATE, TPHATE are recent developments.
- Refer insights from the literature to understand the implementation pipeline and analysis procedure.



#timeliney.timeline(
  show-grid: true,
  {
    import timeliney: *
      
    headerline(group([*Nov*],[*Dec*],[*Jan*],[*Feb*],[*Mar*],[*Apr*]))
    
    task("Literature review", (0, 3), style: (stroke: 2pt + gray))
    task("Writing Proposal", (0.5, 5), style: (stroke: 2pt + gray))
    task("Thesis work ", (1, 5), style: (stroke: 2pt + gray))
    task("Review", (4,6), style: (stroke: 2pt + gray))

    milestone(
      at: 5,
      style: (stroke: (dash: "dashed")),
      align(center, [
        *Main goal completion*\
        April 2025
      ])
    )
  }
)




#line(length: 100%, stroke: gray)

#bibliography("refs.bib", style: "american-psychological-association")
