-- Threat: !InfrastructureShared
-- Name: 1f0d767db979a
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.hstr_full_log()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = 0
if l_0_0[1].matched then
  l_0_1 = l_0_1 + 1
end
if l_0_0[2].matched then
  l_0_1 = l_0_1 + 1
end
local l_0_2 = 0
if l_0_0[3].matched then
  l_0_2 = l_0_2 + 1
end
if l_0_0[4].matched then
  l_0_2 = l_0_2 + 1
end
if l_0_0[5].matched then
  l_0_2 = l_0_2 + 1
end
local l_0_3 = 0
if l_0_0[7].matched then
  l_0_3 = l_0_3 + 1
end
if l_0_0[8].matched then
  l_0_3 = l_0_3 + 1
end
if l_0_0[9].matched then
  l_0_3 = l_0_3 + 1
end
if l_0_0[10].matched then
  l_0_3 = l_0_3 + 1
end
if l_0_0[11].matched then
  l_0_3 = l_0_3 + 1
end
if l_0_0[12].matched then
  l_0_3 = l_0_3 + 1
end
if l_0_0[13].matched then
  l_0_3 = l_0_3 + 1
end
if l_0_0[14].matched then
  l_0_3 = l_0_3 + 1
end
if 1 <= l_0_1 and 1 <= l_0_2 and 1 <= l_0_3 then
  local l_0_4 = {
    "sqlservr.exe",
    "sqlps.exe",
    "sqlagent.exe"
  }
  if IsProcNameInParentProcessTree("cmdhstr", l_0_4) then
    return mp.INFECTED
  end
end
return mp.CLEAN
