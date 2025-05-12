# Collaborative Data Visualisation Assignment

## Overview  

In this assignment, you’ll practice collaborative workflows using Git and GitHub while creating reproducible data visualisations in R. You will select a dataset, generate meaningful plots with either **ggplot2** or **base graphics**, and contribute both your script and image to a shared repository.

## Learning Objectives  

- Initialise, clone and configure a Git repository  
- Create and switch between branches for individual work  
- Stage, commit and push changes  
- Open, review and merge pull requests  
- Resolve merge conflicts  
- Produce clear, reproducible plots in R  

## Prerequisites  

- Familiarity with R and basic plotting  
- Git and GitHub account set up  
- RStudio (recommended) or equivalent environment  
- R packages:  
  - `tidyverse` (for data manipulation and visualisation)
  - `janitor` (optional for data manipulation)
  - `inspectdf` (optional for data inspection)


## Resources

* **Google Drive datasets**
  <https://drive.google.com/drive/folders/1ZhI-t94uZa82KD8hEN0f1WALfCiRFWCP?usp=drive_link>

* **Shared GitHub repository**
  <https://github.com/gbganalyst/reproducible-r-viz>

## Assignment Steps

1. **Clone the repository**

   ```bash
   git clone https://github.com/gbganalyst/reproducible-r-viz.git
   cd reproducible-r-viz.git
   ```

2. **Create a feature branch**

   ```bash
   git checkout -b feature/<yourname>-viz
   ```

3. **Choose and load your data**

   * Browse the Drive folder and select any dataset.
   * Load it into R and explore its structure.

4. **Create your plot**

   * Use **ggplot2** or **base R** to visualise at least one key relationship.
   * Add clear titles, axis labels and, if needed, captions.

5. **Save your work**

   * **Image**: Export your plot as

     ```
     visual-image/<yourname>-plot.png
     ```
   * **Script**: Save your R code as

     ```
     script/<yourname>-script.R
     ```

6. **Commit and push**

   ```bash
   git add visual-image/<yourname>-plot.png script/<yourname>-visualisation.R
   git commit -m "Add visualisation and script for <dataset filename>"
   git push origin feature/<yourname>-viz
   ```

7. **Open a Pull Request**

   * On GitHub, create a PR from your feature branch into `main`.
   * Title:

     ```
     <yourname>: Visualisation for <dataset filename>
     ```
   * Description:

     * Dataset name and source
     * One-sentence summary of the insight your plot reveals

8. **Review & Merge**

   * Provide at least one constructive review on a teammate’s PR.
   * Address any comments or merge conflicts.
   * Once approved, merge your own PR into `main`.

## Deliverables

* A merged PR containing:

  * `visual-images/<yourname>-plot.png`
  * `scripts/<yourname>-visualisation.R`
* Evidence of at least one review comment on a peer’s PR.

## Assessment Criteria

| Criterion             | Excellent                                        | Satisfactory                    | Needs Improvement                          |
| --------------------- | ------------------------------------------------ | ------------------------------- | ------------------------------------------ |
| **Version Control**   | Branching, clear commits, smooth merge           | Branch used, clear commits      | Direct commits to main or unclear messages |
| **Plot Quality**      | Insightful, well-labelled, polished              | Legible, basic labels           | Lacks clarity or labelling                 |
| **Code Organisation** | Modular, commented, fully reproducible           | Runs end-to-end, basic comments | Hard to follow, missing comments           |
| **Collaboration**     | Timely PR, multiple reviews, conflict resolution | PR opened, one review provided  | No PR or reviews                           |

