-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\113b3786164c5\0x000003ea_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if l_0_0 == nil or l_0_0.ppid == nil then
  return mp.CLEAN
end
local l_0_1 = (MpCommon.QuerySessionInformation)(l_0_0.ppid, MpCommon.WTSUserName)
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = ""
local l_0_3 = false
local l_0_4 = false
l_0_3 = pcall(MpCommon.GetUserAccountGroups, "", l_0_1)
if l_0_3 and l_0_2 then
  local l_0_5 = {}
  l_0_5["Backup Operators"] = true
  l_0_5["Print Operators"] = true
  l_0_5["Server Operators"] = true
  l_0_5["Account Operators"] = true
  for l_0_9,l_0_10 in ipairs(l_0_2) do
    if l_0_5[l_0_10.Name] then
      l_0_4 = l_0_10.Name
      break
    end
  end
  do
    do
      if l_0_4 then
        local l_0_11 = scrubData(l_0_1)
        ;
        (bm.add_related_string)("HVAUserAccount", l_0_4 .. ":" .. l_0_11, bm.RelatedStringBMReport)
        return mp.INFECTED
      end
      return mp.CLEAN
    end
  end
end

