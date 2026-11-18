-- Threat: !InfrastructureShared
-- Name: !#InterestingDLLInArchive
-- Type: 10
-- MpAttributes: BM_MZ_DLL

if mp.get_contextdata(mp.CONTEXT_DATA_HAS_MOTW_ADS) ~= true then
  return mp.CLEAN
end
if mp.GetMOTWZone() < 3 then
  return mp.CLEAN
end
local l_0_0 = string.lower(mp.getfilename())
if l_0_0 == nil or string.len(l_0_0) < 10 then
  return mp.CLEAN
end
local l_0_1 = ""
for l_0_2 in string.gmatch(l_0_0, "%.([^%.]+)->") do
  l_0_1 = l_0_1 .. l_0_2 .. "*"
end
local l_0_3 = {
  ["zip*"] = true,
  ["rar*"] = true,
  ["msi*"] = true,
  ["iso*"] = true
}
if l_0_3[l_0_1] == true then
  return mp.INFECTED
end
return mp.CLEAN
