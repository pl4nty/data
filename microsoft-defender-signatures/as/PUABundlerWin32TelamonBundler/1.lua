-- Threat: PUABundler:Win32/TelamonBundler
-- Type: 10
-- Includes: checkProductNameVersionInfrastructure
-- MpAttributes: PUA:Block:TelamonBundler

if pe.get_versioninfo() == nil then
  return mp.INFECTED
end
if checkProductVersion("LT", "1.0.252") == true then
  return mp.INFECTED
end
mp.set_mpattribute("LUA:Telamon.NewProductVersion")
return mp.CLEAN
