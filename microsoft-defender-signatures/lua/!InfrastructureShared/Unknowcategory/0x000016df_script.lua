-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x000016df_luac 

-- params : ...
-- function num : 0
do
  if mp.HSTR_WEIGHT >= 215 then
    local l_0_0 = (versioning.GetOrgID)()
    if l_0_0 == nil or l_0_0 == "" then
      return mp.CLEAN
    end
    l_0_0 = (string.lower)(l_0_0)
    if l_0_0 == "c34db763-35fc-4c4a-9ca4-697338808f18" or l_0_0 == "d7c7c745-195f-4223-9c7a-99fb420fd000" then
      return mp.INFECTED
    else
      if (MpCommon.IsSampled)(90000, false, true, true) == true then
        return mp.INFECTED
      end
    end
  end
  return mp.CLEAN
end

