-- Threat: !InfrastructureShared
-- Name: !#InterestingDLLInMSI
-- Type: 10
-- MpAttributes: BM_MZ_DLL

local l_0_0 = string.lower(mp.getfilename())
if l_0_0 == nil or string.len(l_0_0) < 10 then
  return mp.CLEAN
end
if l_0_0:find(".msi->", 1, true) == nil then
  return mp.CLEAN
end
local l_0_1 = ""
for l_0_2 in string.gmatch(l_0_0, "%.([^%.]+)->") do
  l_0_1 = l_0_1 .. l_0_2 .. "*"
end
local l_0_3 = {
  ["zip*msi*"] = true,
  ["rar*msi*"] = true,
  ["7z*msi*"] = true,
  ["iso*msi*"] = true,
  ["msi*msi*"] = true,
  ["msi*zip*"] = true
}
if l_0_3[l_0_1] == true then
  return mp.INFECTED
end
return mp.CLEAN
