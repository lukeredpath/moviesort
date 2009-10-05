Feature: Sorting a folder of TV show episodes
  In order to keep my TV shows organised
  As a person trying to keep their media server in order
  I want to be able to sort my downloaded TV episodes into folders
  
  @pending
  Scenario: First episode of a new TV show
    Given a folder "/movies/new" containing the movie "The Sopranos - S01E01 - Pilot.avi"
    When I run "moviesort" with the options "--source=/movies --target=/movies/tv"
    Then the movie should be moved to "/movies/tv/The Sopranos/Season 1/The.Sopranos.S01E01.avi"
    
  @pending
  Scenario: First episode of a new season of an existing TV show
    Given a folder "/movies/new" containing the movie "The Sopranos - S06E01 - Members Only.avi"
    And a folder "/movies/tv/The Sopranos" containing the folder "Season 1"
    When I run "moviesort" with the options "--source=/movies --target=/movies/tv"
    Then the movie should be moved to "/movies/tv/The Sopranos/Season 6/The.Sopranos.S06E01.avi"
    And the folder "/movies/tv/The Sopranos/Season 1" should exist
