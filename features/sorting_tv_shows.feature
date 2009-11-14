Feature: Sorting a folder of TV show episodes
  In order to keep my TV shows organised
  As a person trying to keep their media server in order
  I want to be able to sort my downloaded TV episodes into folders
  
  Scenario: First episode of a new TV show
    Given a folder "/movies/new" containing the file "The Sopranos - S01E01 - Pilot.avi"
    When I run Moviesort with the options "--source /movies/new --target /movies/tv"
    Then the movie should be moved to "/movies/tv/The Sopranos/Season 1/The.Sopranos.S01E01.avi"
    
  Scenario: First episode of a new season of an existing TV show
    Given a folder "/movies/new" containing the file "The Sopranos - S06E01 - Members Only.avi"
    And a folder "/movies/tv/The Sopranos" containing the folder "Season 1"
    When I run Moviesort with the options "--source /movies/new --target /movies/tv"
    Then the movie should be moved to "/movies/tv/The Sopranos/Season 6/The.Sopranos.S06E01.avi"
    And the folder "/movies/tv/The Sopranos/Season 1" should exist

  Scenario: Another episode of an existing season of an existing TV show
    Given a folder "/movies/new" containing the file "The Sopranos - S01E02 - 46 Long.avi"
    And a folder "/movies/tv/The Sopranos/Season 1" containing the file "The.Sopranos.S01E01.avi"
    When I run Moviesort with the options "--source /movies/new --target /movies/tv"
    Then the movie should be moved to "/movies/tv/The Sopranos/Season 1/The.Sopranos.S01E02.avi"
