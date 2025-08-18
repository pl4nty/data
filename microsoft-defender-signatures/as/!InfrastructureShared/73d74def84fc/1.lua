-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\73d74def84fc\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = false
local l_0_1 = (mp.GetParentProcInfo)()
do
  if l_0_1 ~= nil then
    local l_0_2 = (string.lower)(l_0_1.image_path)
    if (string.find)(l_0_2, "\\windows\\explorer.exe", 1, true) then
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
  if isnull(l_0_5) or isnull(l_0_6) then
    return mp.CLEAN
  end
  l_0_6 = l_0_6[1]
  l_0_5 = l_0_5[1]
  do
    if not (string.match)(l_0_6, "^(https?)://") then
      local l_0_7 = (string.match)(l_0_5, "^(https?)://")
      l_0_6 = l_0_7 .. "://" .. l_0_6
    end
    local l_0_8 = {}
    l_0_8.SIG_CONTEXT = "CMD"
    l_0_8.CONTENT_SOURCE = "MSIEXEC_CMDLINE"
    l_0_8.PROCESS_CONTEXT = "msiexec.exe"
    l_0_8.FILELESS = "true"
    l_0_8.CMDLINE_URL = "true"
    local l_0_9 = SafeGetUrlReputation
    local l_0_10 = {}
    -- DECOMPILER ERROR at PC85: No list found for R8 , SetList fails

    -- DECOMPILER ERROR at PC86: Overwrote pending register: R9 in 'AssignReg'

    l_0_9 = l_0_9(l_0_10, l_0_6, false, 3000)
    l_0_10 = l_0_9.urls
    l_0_10 = l_0_10[l_0_6]
    if l_0_10 then
      l_0_10 = l_0_9.urls
      l_0_10 = l_0_10[l_0_6]
      l_0_10 = l_0_10.determination
      if l_0_10 == 2 then
        l_0_10 = l_0_9.urls
        l_0_10 = l_0_10[l_0_6]
        l_0_10 = l_0_10.confidence
        if l_0_10 >= 60 then
          l_0_10 = mp
          l_0_10 = l_0_10.INFECTED
          return l_0_10
        end
      end
    end
    l_0_10 = SafeGetUrlReputation
    local l_0_11 = {}
    -- DECOMPILER ERROR at PC110: No list found for R9 , SetList fails

    -- DECOMPILER ERROR at PC111: Overwrote pending register: R10 in 'AssignReg'

    l_0_10 = l_0_10(l_0_11, l_0_5, false, 3000)
    l_0_11 = l_0_10.urls
    l_0_11 = l_0_11[l_0_5]
    if l_0_11 then
      l_0_11 = l_0_10.urls
      l_0_11 = l_0_11[l_0_5]
      l_0_11 = l_0_11.determination
      if l_0_11 == 2 then
        l_0_11 = l_0_10.urls
        l_0_11 = l_0_11[l_0_5]
        l_0_11 = l_0_11.confidence
        if l_0_11 >= 60 then
          l_0_11 = mp
          l_0_11 = l_0_11.INFECTED
          return l_0_11
        end
      end
    end
    l_0_11 = mp
    l_0_11 = l_0_11.CLEAN
    return l_0_11
  end
end

