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
  local l_0_7 = nil
  if not (string.match)(l_0_6, "^(https?)://") then
    local l_0_8 = (string.match)(l_0_5, "^(https?)://")
    l_0_6 = l_0_8 .. "://" .. l_0_6
    local l_0_9 = l_0_6:match("://([^/]+)")
    l_0_7 = l_0_9:match("([^.]+%.[^.]+)$")
    if l_0_7 then
      l_0_7 = l_0_8 .. "://" .. l_0_7
      if l_0_6 == l_0_7 then
        l_0_7 = nil
      end
    end
  end
  do
    local l_0_10 = {}
    l_0_10.SIG_CONTEXT = "CMD"
    l_0_10.CONTENT_SOURCE = "MSIEXEC_CMDLINE"
    l_0_10.PROCESS_CONTEXT = "msiexec.exe"
    l_0_10.FILELESS = "true"
    l_0_10.CMDLINE_URL = "true"
    if l_0_7 then
      local l_0_11 = SafeGetUrlReputation
      local l_0_12 = {}
      -- DECOMPILER ERROR at PC104: No list found for R9 , SetList fails

      -- DECOMPILER ERROR at PC105: Overwrote pending register: R10 in 'AssignReg'

      l_0_11 = l_0_11(l_0_12, l_0_7, false, 3000)
      l_0_12 = l_0_11.urls
      l_0_12 = l_0_12[l_0_7]
      if l_0_12 then
        l_0_12 = l_0_11.urls
        l_0_12 = l_0_12[l_0_7]
        l_0_12 = l_0_12.determination
        if l_0_12 == 2 then
          l_0_12 = l_0_11.urls
          l_0_12 = l_0_12[l_0_7]
          l_0_12 = l_0_12.confidence
          if l_0_12 >= 60 then
            l_0_12 = mp
            l_0_12 = l_0_12.INFECTED
            return l_0_12
          end
        end
      end
    end
    do
      local l_0_13 = SafeGetUrlReputation
      local l_0_14 = {}
      -- DECOMPILER ERROR at PC129: No list found for R9 , SetList fails

      -- DECOMPILER ERROR at PC130: Overwrote pending register: R10 in 'AssignReg'

      l_0_13 = l_0_13(l_0_14, l_0_6, false, 3000)
      l_0_14 = l_0_13.urls
      l_0_14 = l_0_14[l_0_6]
      if l_0_14 then
        l_0_14 = l_0_13.urls
        l_0_14 = l_0_14[l_0_6]
        l_0_14 = l_0_14.determination
        if l_0_14 == 2 then
          l_0_14 = l_0_13.urls
          l_0_14 = l_0_14[l_0_6]
          l_0_14 = l_0_14.confidence
          if l_0_14 >= 60 then
            l_0_14 = mp
            l_0_14 = l_0_14.INFECTED
            return l_0_14
          end
        end
      end
      l_0_14 = SafeGetUrlReputation
      local l_0_15 = {}
      -- DECOMPILER ERROR at PC154: No list found for R10 , SetList fails

      -- DECOMPILER ERROR at PC155: Overwrote pending register: R11 in 'AssignReg'

      l_0_14 = l_0_14(l_0_15, l_0_5, false, 3000)
      l_0_15 = l_0_14.urls
      l_0_15 = l_0_15[l_0_5]
      if l_0_15 then
        l_0_15 = l_0_14.urls
        l_0_15 = l_0_15[l_0_5]
        l_0_15 = l_0_15.determination
        if l_0_15 == 2 then
          l_0_15 = l_0_14.urls
          l_0_15 = l_0_15[l_0_5]
          l_0_15 = l_0_15.confidence
          if l_0_15 >= 60 then
            l_0_15 = mp
            l_0_15 = l_0_15.INFECTED
            return l_0_15
          end
        end
      end
      l_0_15 = mp
      l_0_15 = l_0_15.CLEAN
      return l_0_15
    end
  end
end

