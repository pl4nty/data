-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ArchiveWithDllAndExec\1.luac 

-- params : ...
-- function num : 0
if (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_0 = (mp.getfilename)()
if (l_0_0 and (MpCommon.PathToWin32Path)(l_0_0)) or not l_0_0 then
  return mp.CLEAN
end
l_0_0 = (string.lower)(l_0_0)
local l_0_1 = (string.match)(l_0_0, "(.*)%->")
local l_0_2 = (string.match)(l_0_0, "%w+%->.*/(.*)")
local l_0_3 = 259200
local l_0_4 = 1000
AppendToRollingQueue("ArchivesWithExec_FileName", l_0_2, l_0_1, l_0_3, l_0_4, 0)
local l_0_5 = ((string.match)(l_0_2, "%.(.*)$"))
local l_0_6 = nil
if l_0_5 == "exe" then
  l_0_6 = ".dll"
else
  l_0_6 = ".exe"
end
local l_0_7, l_0_8, l_0_9 = IsKeyInRollingQueue("ArchivesWithExec_FileName", l_0_6, false)
if not l_0_7 or not l_0_9 then
  return mp.CLEAN
end
for l_0_13,l_0_14 in ipairs(l_0_9) do
  if l_0_14.value == l_0_1 then
    set_research_data("Evidence", (MpCommon.Base64Encode)(l_0_0 .. "|" .. l_0_14.key), false)
    local l_0_15 = (string.match)(l_0_2, "(.-)%->")
    local l_0_16 = (string.match)(l_0_14.key, "([^\\>]+)$")
    if l_0_15 and l_0_16 then
      local l_0_17, l_0_18 = nil, nil
      if l_0_6 == ".exe" then
        l_0_18 = l_0_16
        l_0_17 = l_0_15
      else
        l_0_18 = l_0_15
        l_0_17 = l_0_16
      end
      local l_0_19, l_0_20, l_0_21 = IsDllInExpectedPath(l_0_17, l_0_1, l_0_18)
      if l_0_21 then
        (mp.set_mpattribute)("DllSideLoading_VulnerableExe->" .. l_0_21)
      end
      if l_0_19 then
        (mp.set_mpattribute)("DllSideLoading_VulnerableDll->" .. l_0_19)
      end
    end
    do
      do
        do return mp.INFECTED end
        -- DECOMPILER ERROR at PC140: LeaveBlock: unexpected jumping out DO_STMT

        -- DECOMPILER ERROR at PC140: LeaveBlock: unexpected jumping out IF_THEN_STMT

        -- DECOMPILER ERROR at PC140: LeaveBlock: unexpected jumping out IF_STMT

      end
    end
  end
end
return mp.CLEAN

