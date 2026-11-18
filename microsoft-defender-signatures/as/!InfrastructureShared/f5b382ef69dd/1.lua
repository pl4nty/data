-- Threat: !InfrastructureShared
-- Name: f5b382ef69dd
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
if l_0_0 ~= nil then
  local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0)
  for l_0_2, l_0_3 in ipairs(l_0_1) do
    if sysio.IsFileExists(l_0_3) then
      bm.add_related_file(l_0_3)
      mp.ReportLowfi(l_0_3, 2703845775)
    end
  end
  add_parents()
  return mp.INFECTED
end
return mp.CLEAN
