-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\d6b3b070522c\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if not l_0_0 or not l_0_0.ppid then
  return mp.CLEAN
end
local l_0_1, l_0_2 = GetAppomalyProcessAttribute(l_0_0.ppid)
if not l_0_1 then
  return mp.CLEAN
end
reportSessionInformation()
add_parents()
reportRelevantUntrustedEntities(0)
local l_0_3 = nil
if (this_sigattrlog[1]).matched then
  l_0_3 = "LolBinsWin"
else
  if (this_sigattrlog[2]).matched then
    l_0_3 = "ExploratoryCommands"
  else
    if (this_sigattrlog[3]).matched then
      l_0_3 = "InterestingPSCommands"
    else
      if (this_sigattrlog[4]).matched then
        l_0_3 = "InterestingCmdArgs"
      end
    end
  end
end
;
(bm.add_related_string)("DetectorID", l_0_3, bm.RelatedStringBMReport)
local l_0_4 = {}
-- DECOMPILER ERROR at PC66: No list found for R4 , SetList fails

local l_0_5 = {}
-- DECOMPILER ERROR at PC68: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC69: Overwrote pending register: R7 in 'AssignReg'

for l_0_9,l_0_10 in ("ExploratoryCommands")("InterestingPSCommands") do
  local l_0_11 = GetRollingQueueKeyValues("PFApp_Pid_" .. l_0_10, l_0_0.ppid)
  l_0_5[l_0_10] = {}
  local l_0_12 = 0
  for l_0_16,l_0_17 in ipairs(l_0_11) do
    -- DECOMPILER ERROR at PC93: Confused about usage of register: R18 in 'UnsetPending'

    if not l_0_5[l_0_17.value] and l_0_12 < 10 then
      (l_0_5[l_0_10])[l_0_17.value] = true
      l_0_12 = l_0_12 + 1
    end
  end
end
;
(bm.add_related_string)("Exploratory_Commands", safeJsonSerialize(l_0_5), bm.RelatedStringBMReport)
if l_0_0 then
  local l_0_18 = nil
  local l_0_19 = nil
  l_0_18(l_0_19, 5, "ExploratoryCmd[" .. (l_0_0.ppid):match("pid:(%d+)") .. "]", l_0_1, {InterestingCommands = l_0_5})
end
do
  do return mp.INFECTED end
  -- DECOMPILER ERROR at PC129: Confused about usage of register R7 for local variables in 'ReleaseLocals'

end

