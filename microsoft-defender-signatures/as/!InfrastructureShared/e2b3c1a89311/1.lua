-- Threat: !InfrastructureShared
-- Name: e2b3c1a89311
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  TrackPidAndTechniqueBM(l_0_0.ppid, "T1003.003", "NtdsSCCopy", 60)
else
  TrackPidAndTechniqueBM("BM", "T1003.003", "NtdsSCCopy", 60)
end
local l_0_1 = string.lower(this_sigattrlog[2].utf8p2)
if l_0_1 ~= nil then
  local l_0_2 = mp.GetExecutablesFromCommandLine(l_0_1)
  for l_0_3, l_0_4 in ipairs(l_0_2) do
    if sysio.IsFileExists(l_0_4) then
      bm.add_related_file(l_0_4)
      mp.ReportLowfi(l_0_4, 1327958179)
    end
  end
end
local l_0_5 = ""
local l_0_6 = ""
if this_sigattrlog[3].matched then
  l_0_5 = this_sigattrlog[3].utf8p1
  l_0_6 = this_sigattrlog[3].utf8p2
end
if l_0_5 ~= nil and l_0_5 ~= "" and l_0_6 ~= nil and l_0_6 ~= "" then
  bm.trigger_sig("NTDSDump_" .. l_0_5, l_0_6)
end
add_parents()
return mp.INFECTED
