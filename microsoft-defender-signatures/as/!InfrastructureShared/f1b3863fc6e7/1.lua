-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\f1b3863fc6e7\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = false
do
  if ((((this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2) or ((this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p2) or ((this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p2) or (this_sigattrlog[5]).matched)) then
    local l_0_1, l_0_2, l_0_3, l_0_5, l_0_7, l_0_11, l_0_13 = (this_sigattrlog[5]).utf8p2
  end
  -- DECOMPILER ERROR at PC39: Confused about usage of register: R1 in 'UnsetPending'

  if not l_0_1 then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC46: Confused about usage of register: R1 in 'UnsetPending'

  -- DECOMPILER ERROR at PC53: Confused about usage of register: R1 in 'UnsetPending'

  do
    if not (string.match)(l_0_1, "Uri=([^;]+)") then
      local l_0_4, l_0_6, l_0_8, l_0_12, l_0_14 = , (string.match)(l_0_1, "DestIp=([^;]*);")
      if l_0_6 then
        l_0_8 = isPublicIP
        l_0_12 = l_0_6
        l_0_8 = l_0_8(l_0_12)
      end
      if not l_0_8 then
        l_0_8 = mp
        l_0_8 = l_0_8.CLEAN
        return l_0_8
      end
      l_0_0 = true
    end
    -- DECOMPILER ERROR at PC71: Confused about usage of register: R2 in 'UnsetPending'

    if not l_0_0 then
      local l_0_9 = nil
      if next(ExtractPartsFromUri(l_0_6)) ~= nil and (ExtractPartsFromUri(l_0_6)).host ~= nil then
        local l_0_10 = nil
        -- DECOMPILER ERROR at PC96: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC98: Confused about usage of register: R4 in 'UnsetPending'

        if (string.gsub)((string.lower)(tostring((ExtractPartsFromUri(l_0_6)).host)), "%.$", "") == "localhost" or (string.gsub)((string.lower)(tostring((ExtractPartsFromUri(l_0_6)).host)), "%.$", "") == "127.0.0.1" or (string.gsub)((string.lower)(tostring((ExtractPartsFromUri(l_0_6)).host)), "%.$", "") == "::1" then
          return mp.CLEAN
        end
      end
    end
    do
      local l_0_15 = nil
      -- DECOMPILER ERROR at PC124: Confused about usage of register: R2 in 'UnsetPending'

      if contains(l_0_10, {"core.microsoft", "adobedtm.com", "npmjs.org", "mce-sys.com", "adobess.com", "anthropic.com", "cloud.microsoft", "npmmirror.com", "preyproject.com", "adobelogin.com", "adobe.com", "adobe.io", "adobesc.com", "playwright.dev", "githubcopilot.com", "nuget.org", "http://192.168.", "http://10."}) then
        return mp.CLEAN
      end
      local l_0_16 = nil
      -- DECOMPILER ERROR at PC145: Overwrote pending register: R4 in 'AssignReg'

      if not (this_sigattrlog[1]).matched or (this_sigattrlog[1]).utf8p2 == nil or isnull(nil) then
        return mp.CLEAN
      end
      -- DECOMPILER ERROR at PC154: Confused about usage of register: R4 in 'UnsetPending'

      local l_0_17 = nil
      if ((nil):lower()):match("node%.exe\"?%s+\"?([^\"]+%.js)\"?") then
        (bm.add_related_file)(((nil):lower()):match("node%.exe\"?%s+\"?([^\"]+%.js)\"?"))
      end
      local l_0_18 = nil
      if not l_0_0 then
        if not (string.find)(l_0_16, "%.") then
          return mp.CLEAN
        end
        if (mp.CheckUrl)(l_0_16) == 1 and l_0_16 == 1 then
          return mp.CLEAN
        end
      end
      local l_0_19 = nil
      local l_0_20 = {SIG_CONTEXT = "NODE_JS", CONTENT_SOURCE = "BM", TAG = "INTERFLOW"}
      if ((SafeGetUrlReputation({l_0_16}, l_0_20, false, 2000)).urls)[l_0_16] and (((SafeGetUrlReputation({l_0_16}, l_0_20, false, 2000)).urls)[l_0_16]).determination == 2 and (((SafeGetUrlReputation({l_0_16}, l_0_20, false, 2000)).urls)[l_0_16]).confidence >= 60 then
        return mp.INFECTED
      end
      return mp.CLEAN
    end
  end
end

