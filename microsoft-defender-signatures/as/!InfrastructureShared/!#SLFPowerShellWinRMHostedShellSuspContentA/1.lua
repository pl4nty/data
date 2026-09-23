-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFPowerShellWinRMHostedShellSuspContentA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if isnull(l_0_0) or l_0_0 < 16 then
  return mp.CLEAN
end
do
  local l_0_1, l_0_2, l_0_3 = l_0_0 > 131072 and 131072 or l_0_0
  ;
  (mp.readprotection)(false)
  -- DECOMPILER ERROR at PC26: Confused about usage of register: R1 in 'UnsetPending'

  local l_0_4 = nil
  ;
  (mp.readprotection)(true)
  if isnull((mp.readfile)(0, l_0_1)) then
    return mp.CLEAN
  end
  local l_0_5 = nil
  local l_0_6 = (string.lower)(tostring((mp.readfile)(0, l_0_1)))
  local l_0_7 = function(l_1_0, l_1_1)
  -- function num : 0_0
  for l_1_5,l_1_6 in ipairs(l_1_1) do
    if (string.find)(l_1_0, l_1_6, 1, true) then
      return true
    end
  end
  return false
end

  local l_0_8 = {"invoke-binary", "dll-loader", "donut-loader", "bypass-4msi", "evil-winrm", "evilwinrm", "invoke-donut"}
  local l_0_9 = {"[io.file]::writeallbytes", "[system.io.file]::writeallbytes", "[io.file]::openwrite", "[system.io.file]::openwrite", "[io.file]::appendallbytes", "[system.io.file]::appendallbytes"}
  local l_0_10 = {"[io.file]::readallbytes", "[system.io.file]::readallbytes", "-encoding byte", "-asbytestream"}
  local l_0_11 = {"[reflection.assembly]::load", "[system.reflection.assembly]::load", "assembly.load(", "invoke-expression", "iex(", "iex (", "virtualalloc", "createthread", "io.memorystream"}
  local l_0_12 = {"amsiutils", "amsiinitfailed", "amsicontext", "amsiscanbuffer", "set-mppreference", "add-mppreference", "disablerealtimemonitoring", "etweventprovider", "psetwlogprovider"}
  local l_0_13 = {"sekurlsa", "lsadump", "invoke-mimikatz", "comsvcs", "minidump", "safetykatz", "rubeus", "kerberoast", "sharphound", "invoke-bloodhound"}
  if l_0_7(l_0_6, l_0_8) then
    set_research_data("winrm_amsi_reason", "family_helper", false)
    return mp.INFECTED
  end
  local l_0_15 = {"downloadstring", "downloadfile", "net.webclient", "invoke-webrequest", "invoke-restmethod", "start-bitstransfer", "system.net.sockets"}
  do
    if l_0_7(l_0_6, l_0_9) and (string.find)(l_0_6, "frombase64string", 1, true) then
      local l_0_14 = 0 + 1
      -- DECOMPILER ERROR at PC147: Confused about usage of register: R13 in 'UnsetPending'

      -- DECOMPILER ERROR at PC147: Confused about usage of register: R13 in 'UnsetPending'

      ;
      ({})[#{} + 1] = "upload"
    end
    -- DECOMPILER ERROR at PC163: Confused about usage of register: R12 in 'UnsetPending'

    -- DECOMPILER ERROR at PC164: Confused about usage of register: R13 in 'UnsetPending'

    -- DECOMPILER ERROR at PC166: Confused about usage of register: R13 in 'UnsetPending'

    -- DECOMPILER ERROR at PC166: Confused about usage of register: R13 in 'UnsetPending'

    -- DECOMPILER ERROR at PC174: Confused about usage of register: R13 in 'UnsetPending'

    -- DECOMPILER ERROR at PC176: Confused about usage of register: R13 in 'UnsetPending'

    -- DECOMPILER ERROR at PC176: Confused about usage of register: R13 in 'UnsetPending'

    -- DECOMPILER ERROR at PC184: Confused about usage of register: R13 in 'UnsetPending'

    -- DECOMPILER ERROR at PC186: Confused about usage of register: R13 in 'UnsetPending'

    -- DECOMPILER ERROR at PC186: Confused about usage of register: R13 in 'UnsetPending'

    -- DECOMPILER ERROR at PC194: Confused about usage of register: R13 in 'UnsetPending'

    -- DECOMPILER ERROR at PC196: Confused about usage of register: R13 in 'UnsetPending'

    -- DECOMPILER ERROR at PC196: Confused about usage of register: R13 in 'UnsetPending'

    -- DECOMPILER ERROR at PC204: Confused about usage of register: R13 in 'UnsetPending'

    -- DECOMPILER ERROR at PC206: Confused about usage of register: R13 in 'UnsetPending'

    -- DECOMPILER ERROR at PC206: Confused about usage of register: R13 in 'UnsetPending'

    if ((((not l_0_7(l_0_6, l_0_10) or not (string.find)(l_0_6, "tobase64string", 1, true) or l_0_7(l_0_6, l_0_11)) and not l_0_7(l_0_6, l_0_12)) or l_0_7(l_0_6, l_0_13)) and not l_0_7(l_0_6, l_0_15)) or l_0_14 + 1 + 1 + 1 + 1 + 1 < 2 then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC216: Confused about usage of register: R13 in 'UnsetPending'

    set_research_data("winrm_amsi_reason", (table.concat)({}, ","), false)
    -- DECOMPILER ERROR at PC224: Confused about usage of register: R12 in 'UnsetPending'

    set_research_data("winrm_amsi_categories", tostring(l_0_14 + 1 + 1 + 1 + 1 + 1), false)
    return mp.INFECTED
  end
end

