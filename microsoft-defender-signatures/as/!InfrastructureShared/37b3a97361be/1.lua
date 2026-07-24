-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\37b3a97361be\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 then
    local l_0_0, l_0_1 = nil
  end
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R0 in 'UnsetPending'

  if l_0_0 == nil then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC20: Confused about usage of register: R0 in 'UnsetPending'

  local l_0_2 = nil
  local l_0_3 = (string.lower)(l_0_0)
  if not contains(l_0_3, {"invoke-expression", "iex(", "iex ", "|iex", "| iex", ";iex", "invoke-webrequest", "iwr ", "invoke-restmethod", "irm ", "downloadstring", "downloadfile", "downloaddata", "net.webclient", "webclient).download", "system.net", "frombase64string", "-encodedcommand", "-enc ", "-nop", "-noprofile", "-noninteractive", "-w hidden", "-windowstyle hidden", "-windowstyle h", "-executionpolicy bypass", "-ep bypass", "start-bitstransfer", "bitsadmin /transfer", "-urlcache", "certutil -", "certutil.exe", "regsvr32 /i:http", "regsvr32 /s /n /u /i:", "scrobj", "mshta http", "mshta javascript", "mshta vbscript", "rundll32", "curl http", "curl -o", "wget http", "finger ", "tar -x", "curl -sk", "wget -", "msiexec /i http", "msiexec /q ", "-usebasicparsing", "-wi ", "-w h", "-noexit"}) then
    return mp.CLEAN
  end
  return mp.INFECTED
end

