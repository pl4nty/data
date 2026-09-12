-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanPowerShellFakeVerifyDownloadA\1.luac 

-- params : ...
-- function num : 0
if (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_AMSI then
  return mp.CLEAN
end
local l_0_0 = (mp.getfilesize)()
if l_0_0 == nil or l_0_0 < 200 or l_0_0 > 8192 then
  return mp.CLEAN
end
;
(mp.readprotection)(false)
local l_0_1, l_0_2 = pcall(mp.readfile, 0, l_0_0)
;
(mp.readprotection)(true)
if not l_0_1 or type(l_0_2) ~= "string" or #l_0_2 < 200 then
  return mp.CLEAN
end
local l_0_3 = l_0_2
do
  if (string.find)((string.sub)(l_0_3, 1, 64), (string.char)(0), 1, true) then
    local l_0_4, l_0_5 = pcall(mp.utf16to8, l_0_3)
    if l_0_4 and type(l_0_5) == "string" and #l_0_5 > 0 then
      l_0_3 = l_0_5
    end
  end
  if #l_0_3 < 200 or #l_0_3 > 8192 then
    return mp.CLEAN
  end
  local l_0_6 = (string.lower)((string.gsub)(l_0_3, "[%^`]", ""))
  local l_0_7 = 0
  local l_0_8 = {}
  -- DECOMPILER ERROR at PC115: No list found for R6 , SetList fails

  -- DECOMPILER ERROR at PC116: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC117: Overwrote pending register: R8 in 'AssignReg'

  for l_0_12,l_0_13 in ("cloudflare")("security verification") do
    -- DECOMPILER ERROR at PC120: Overwrote pending register: R12 in 'AssignReg'

    -- DECOMPILER ERROR at PC122: Overwrote pending register: R13 in 'AssignReg'

    -- DECOMPILER ERROR at PC123: Overwrote pending register: R14 in 'AssignReg'

    -- DECOMPILER ERROR at PC124: Overwrote pending register: R15 in 'AssignReg'

  end
  if not (("cloudflare verification failed").find)("verification completed", "verification finished", "verification successful", true) or l_0_7 < 2 then
    return mp.CLEAN
  end
  if (not (string.find)(l_0_6, "new-object net.webclient", 1, true) and not (string.find)(l_0_6, "new-object system.net.webclient", 1, true)) or not (string.find)(l_0_6, ".downloadfile(", 1, true) then
    return mp.CLEAN
  end
  if not (string.find)(l_0_6, "expand-archive", 1, true) then
    return mp.CLEAN
  end
  if not (string.find)(l_0_6, ".zip", 1, true) then
    return mp.CLEAN
  end
  if not (string.find)(l_0_6, ".bat", 1, true) then
    return mp.CLEAN
  end
  if (string.find)(l_0_6, "cmd /c", 1, true) or (string.find)(l_0_6, "; & ", 1, true) or not (string.find)(l_0_6, "\n& ", 1, true) then
    return mp.CLEAN
  end
  return mp.INFECTED
end

