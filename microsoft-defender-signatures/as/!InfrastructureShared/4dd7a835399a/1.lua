-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\4dd7a835399a\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = false
local l_0_1 = (mp.GetParentProcInfo)()
do
  if l_0_1 ~= nil then
    local l_0_2 = (string.lower)(l_0_1.image_path)
    if (string.find)(l_0_2, "\\explorer.exe", 1, true) then
      l_0_0 = true
    end
  end
  if not l_0_0 then
    return mp.CLEAN
  end
  local l_0_3 = (mp.GetScannedPPID)()
  if l_0_3 == nil then
    return mp.CLEAN
  end
  local l_0_4 = (mp.GetProcessCommandLine)(l_0_3)
  if l_0_4 == nil then
    return mp.CLEAN
  end
  local l_0_5, l_0_6 = extract_urls(l_0_4)
  if isnull(l_0_5) then
    return mp.CLEAN
  end
  l_0_5 = l_0_5[1]
  local l_0_7 = {}
  l_0_7.SIG_CONTEXT = "CMD"
  l_0_7.CONTENT_SOURCE = "MSHTA_CMDLINE"
  l_0_7.PROCESS_CONTEXT = "mshta.exe"
  l_0_7.FILELESS = "true"
  l_0_7.CMDLINE_URL = "true"
  local l_0_8 = SafeGetUrlReputation
  local l_0_9 = {}
  -- DECOMPILER ERROR at PC63: No list found for R8 , SetList fails

  -- DECOMPILER ERROR at PC64: Overwrote pending register: R9 in 'AssignReg'

  l_0_8 = l_0_8(l_0_9, l_0_5, false, 3000)
  l_0_9 = l_0_8.urls
  l_0_9 = l_0_9[l_0_5]
  if l_0_9 then
    l_0_9 = l_0_8.urls
    l_0_9 = l_0_9[l_0_5]
    l_0_9 = l_0_9.determination
    if l_0_9 == 2 then
      l_0_9 = l_0_8.urls
      l_0_9 = l_0_9[l_0_5]
      l_0_9 = l_0_9.confidence
      if l_0_9 >= 60 then
        l_0_9 = mp
        l_0_9 = l_0_9.INFECTED
        return l_0_9
      end
    end
  end
  l_0_9 = mp
  l_0_9 = l_0_9.CLEAN
  return l_0_9
end

