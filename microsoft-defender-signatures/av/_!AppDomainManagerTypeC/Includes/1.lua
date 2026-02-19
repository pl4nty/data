-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\_!AppDomainManagerTypeC\Includes\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if isnull(l_0_0) or (string.find)(l_0_0, "program files", 1, true) or not (string.find)(l_0_0, ".exe.config$") then
  return mp.CLEAN
end
l_0_0 = (MpCommon.PathToWin32Path)(l_0_0)
local l_0_1 = l_0_0:match("^(.*)[/\\][^/\\]+$")
local l_0_2 = math_min(10000, (mp.getfilesize)() or 0)
if l_0_2 == 0 then
  return mp.CLEAN
end
;
(mp.readprotection)(false)
local l_0_3 = tostring((mp.readfile)(0, l_0_2))
;
(mp.readprotection)(true)
local l_0_4 = l_0_3:match("<appDomainManagerAssembly value=\"([^\"\r\n\\,]+)")
if isnull(l_0_4) then
  return mp.CLEAN
end
if not (string.find)(l_0_4, ".exe$") then
  l_0_4 = l_0_4 .. ".exe"
end
do
  local l_0_5, l_0_6, l_0_7 = l_0_3:match("<probing privatePath=\"([^\"\r\n]+)") or l_0_1
  -- DECOMPILER ERROR at PC100: Confused about usage of register: R5 in 'UnsetPending'

  -- DECOMPILER ERROR at PC103: Confused about usage of register: R5 in 'UnsetPending'

  local l_0_8 = nil
  if not (sysio.IsFileExists)((MpCommon.PathToWin32Path)(l_0_5 .. ((string.sub)(l_0_5, -1) == "\\" and "" or "\\") .. l_0_4)) and (l_0_8 == l_0_1 or not (sysio.IsFileExists)(l_0_1 .. "\\" .. l_0_4)) then
    return mp.CLEAN
  end
  local l_0_9 = nil
  ;
  (mp.ReportLowfi)(l_0_9, 1924697406)
  ;
  (mp.set_mpattribute)((string.format)("%s!%s", "SuspiciousAppDomainAssembly", l_0_9))
  -- DECOMPILER ERROR at PC157: Confused about usage of register: R7 in 'UnsetPending'

  ;
  (MpCommon.SetOriginalFileName)(l_0_9, (string.format)("BM_%s", "SuspiciousAppDomainAssembly"))
  local l_0_10 = nil
  if not isnull((mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)) then
    (MpCommon.BmTriggerSig)((mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID), l_0_10, (string.format)("Config=%s;Assembly=%s", l_0_0, l_0_9))
  end
  return mp.INFECTED
end

