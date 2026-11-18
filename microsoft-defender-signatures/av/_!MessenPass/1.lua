-- Threat: \xd8!MessenPass
-- Type: 10
-- Includes: checkProductNameVersionInfrastructure
-- MpAttributes: HSTR:HackTool:MessenPass

if pe.get_versioninfo() == nil then
  return mp.CLEAN
end
if checkProductVersion("GTE", "1.43") == true then
  mp.set_mpattribute("PUA:Block:MessenPass")
  return mp.CLEAN
end
return mp.INFECTED
