-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#BLKACCd3e037e1-3eb8-44c8-a917-57927947596d\1_luac 

-- params : ...
-- function num : 0
if (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_AMSI then
  return mp.CLEAN
end
if not (mp.IsHipsRuleEnabled)("d3e037e1-3eb8-44c8-a917-57927947596d") then
  return mp.CLEAN
end
local l_0_0 = false
local l_0_1 = (mp.get_contextdata)(mp.CONTEXT_DATA_AMSI_CONTENTNAME)
if l_0_1 ~= nil and l_0_1 ~= "" then
  l_0_1 = (string.lower)(l_0_1)
  if (#l_0_1 > 10 and (string.find)(l_0_1, "^memscanvfz") == nil) or #l_0_1 <= 10 then
    if #l_0_1 > 7 and (string.find)(l_0_1, "^\\device\\") ~= nil then
      l_0_1 = (string.lower)((MpCommon.PathToWin32Path)(l_0_1))
    end
    local l_0_2 = (versioning.GetOrgID)()
    -- DECOMPILER ERROR at PC85: Unhandled construct in 'MakeBoolean' P1

    if l_0_2 ~= nil and (string.lower)(l_0_2) == "a30c11a9-ee43-4b6e-ab72-7be51053daba" and (string.find)(l_0_1, "^file://") ~= nil then
      l_0_0 = true
    end
  end
end
do
  if (sysio.IsFileExists)(l_0_1) then
    l_0_0 = true
  end
  if l_0_0 == false then
    l_0_1 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
    if (#l_0_1 > 10 and (string.find)(l_0_1, "^memscanvfz") == nil) or #l_0_1 <= 10 then
      if #l_0_1 > 7 and (string.find)(l_0_1, "^\\device\\") ~= nil then
        l_0_1 = (string.lower)((MpCommon.PathToWin32Path)(l_0_1))
      end
      if (sysio.IsFileExists)(l_0_1) then
        l_0_0 = true
      end
    end
  end
  if l_0_0 and (mp.IsPathExcludedForHipsRule)(l_0_1, "d3e037e1-3eb8-44c8-a917-57927947596d") then
    return mp.CLEAN
  end
  return mp.INFECTED
end

