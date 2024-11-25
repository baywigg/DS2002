import pandas as pd

def transform_gapminder(gapminder, entities):
    # Remove countries that only appear in gapminder, and not our other dataset
    gapminder = gapminder[gapminder["country"].isin(entities)]

    return gapminder