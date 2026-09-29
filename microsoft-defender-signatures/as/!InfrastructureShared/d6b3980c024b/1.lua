-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\d6b3980c024b\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if not l_0_0 or not next(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = (string.lower)(l_0_0.command_line or "")
local l_0_2 = ""
local l_0_3 = (mp.GetParentProcInfo)()
if l_0_3 and l_0_3.image_path then
  l_0_2 = (string.lower)(l_0_3.image_path)
end
do
  local l_0_4 = {}
  -- DECOMPILER ERROR at PC45: No list found for R4 , SetList fails

  -- DECOMPILER ERROR at PC46: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC47: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC48: Overwrote pending register: R7 in 'AssignReg'

  if not ("\\w3wp.exe")("fastcgi", "\\tomcat") then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC59: Overwrote pending register: R8 in 'AssignReg'

  ;
  (bm.add_related_string)("[->] AMSI-FAIL WEBSHELL PARENT: ", l_0_2, ("\\java.exe").RelatedStringBMReport)
  ;
  (bm.add_related_string)("[->] AMSI-FAIL WEBSHELL CMD: ", l_0_1, bm.RelatedStringBMReport)
  -- DECOMPILER ERROR at PC72: Overwrote pending register: R9 in 'AssignReg'

  bm_AddRelatedFileFromCommandLine(l_0_1, nil, nil, "\\javaw.exe")
  if l_0_0.ppid then
    (bm.request_SMS)(l_0_0.ppid, "h+")
    ;
    (bm.add_action)("SmsAsyncScanEvent", 1)
  end
  -- DECOMPILER ERROR at PC92: Overwrote pending register: R10 in 'AssignReg'

  triggerMemoryScanOnProcessTree(true, true, "SMS_H", 5000, "\\httpd.exe")
  add_parents()
  do return mp.INFECTED end
  -- WARNING: undefined locals caused missing assignments!
end

