-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanPowerShellReplaceMarkerLoaderA!MTB\1.luac 

-- params : ...
-- function num : 0
if not (mp.get_mpattribute)("SCRIPT:PowerShell/InvokExpDoll.A!MTB") then
  return mp.CLEAN
end
local l_0_0 = (mp.getfilesize)()
if l_0_0 == nil or l_0_0 <= 0 then
  return mp.CLEAN
end
;
(mp.readprotection)(false)
do
  local l_0_1, l_0_2, l_0_3, l_0_4, l_0_5, l_0_7, l_0_9, l_0_10, l_0_12, l_0_13, l_0_15 = tostring((mp.readfile)(0, l_0_0)) or ""
  ;
  (mp.readprotection)(true)
  -- DECOMPILER ERROR at PC37: Confused about usage of register: R1 in 'UnsetPending'

  if l_0_1 == "" then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC44: Confused about usage of register: R1 in 'UnsetPending'

  -- DECOMPILER ERROR at PC51: Confused about usage of register: R1 in 'UnsetPending'

  do
    if not (string.match)(l_0_1, "%-replace%s*\'([%a][%w_]*)\'%s*,%s*\'\'") then
      local l_0_6, l_0_8, l_0_11, l_0_14, l_0_16 = , (string.match)(l_0_1, "%-replace%s*\"([%a][%w_]*)\"%s*,%s*\"\"")
    end
    -- DECOMPILER ERROR at PC54: Confused about usage of register: R2 in 'UnsetPending'

    if l_0_8 == nil then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC59: Confused about usage of register: R2 in 'UnsetPending'

    -- DECOMPILER ERROR at PC62: Confused about usage of register: R2 in 'UnsetPending'

    if #l_0_8 < 2 or #l_0_8 > 12 then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC70: Confused about usage of register: R1 in 'UnsetPending'

    -- DECOMPILER ERROR at PC71: Confused about usage of register: R2 in 'UnsetPending'

    local l_0_17, l_0_18 = nil
    if l_0_6 < 25 then
      return mp.CLEAN
    end
    local l_0_19 = (string.gsub)(l_0_6, l_0_8, "")
    local l_0_20 = nil
    local l_0_21 = (string.lower)((string.gsub)(l_0_17, l_0_18, ""))
    local l_0_22 = 0
    local l_0_23 = str_count_match
    l_0_23 = l_0_23(l_0_21, {"invoke-expression", "iex", "system.security.cryptography.aes", "createdecryptor", "transformfinalblock", "frombase64string", "unicode.getstring", "system.io.compression.gzipstream", "compressionmode", "memorystream", "reflection.assembly", "entrypoint", "rawui.windowtitle"})
    l_0_22 = l_0_22 + l_0_23
    if l_0_22 < 5 then
      l_0_23 = mp
      l_0_23 = l_0_23.CLEAN
      return l_0_23
    end
    l_0_23 = mp
    l_0_23 = l_0_23.INFECTED
    return l_0_23
  end
end

