-- Threat: \xd8!WebBrowserPassView
-- Type: 10
-- Includes: checkProductNameVersionInfrastructure
-- MpAttributes: HSTR:HackTool:WebBrowserPassView

if pe.get_versioninfo() == nil then
  return mp.CLEAN
end
if checkProductVersion("GTE", "1.56") == true then
  mp.set_mpattribute("PUA:Block:WebBrowserPassView")
  return mp.CLEAN
end
return mp.INFECTED
