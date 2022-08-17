#TEMPLATE(UtilitiesTemplate,'Utilities Template'),FAMILY('ABC','CW20')
#EXTENSION(IncludeUtilities,'Include Utilities'),APPLICATION
#AT(%AfterGlobalIncludes)
    INCLUDE('Utilities.inc'),ONCE
#ENDAT