-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1f4b33781eaac\1_luac 

-- params : ...
-- function num : 0
local l_0_7 = nil
local l_0_8 = (string.lower)((bm.get_imagepath)())
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 then
  local l_0_0 = false
else
  do
    -- DECOMPILER ERROR at PC33: Overwrote pending register: R0 in 'AssignReg'

    -- DECOMPILER ERROR at PC47: Overwrote pending register: R0 in 'AssignReg'

    if (not (this_sigattrlog[2]).matched or not (this_sigattrlog[2]).utf8p2 or (this_sigattrlog[3]).matched) and (this_sigattrlog[3]).utf8p2 then
      local l_0_1 = nil
    else
      do
        -- DECOMPILER ERROR at PC61: Overwrote pending register: R0 in 'AssignReg'

        -- DECOMPILER ERROR at PC75: Overwrote pending register: R0 in 'AssignReg'

        if (not (this_sigattrlog[4]).matched or not (this_sigattrlog[4]).utf8p2 or (this_sigattrlog[5]).matched) and (this_sigattrlog[5]).utf8p2 then
          local l_0_2 = nil
        else
          do
            -- DECOMPILER ERROR at PC89: Overwrote pending register: R0 in 'AssignReg'

            -- DECOMPILER ERROR at PC103: Overwrote pending register: R0 in 'AssignReg'

            if (not (this_sigattrlog[6]).matched or not (this_sigattrlog[6]).utf8p2 or (this_sigattrlog[7]).matched) and (this_sigattrlog[7]).utf8p2 then
              local l_0_3, l_0_4, l_0_5, l_0_6 = nil
            else
              do
                -- DECOMPILER ERROR at PC117: Overwrote pending register: R0 in 'AssignReg'

                if not (this_sigattrlog[8]).matched or not (this_sigattrlog[8]).utf8p2 or not l_0_7 then
                  return mp.CLEAN
                end
                if not l_0_8 then
                  return mp.CLEAN
                end
                local l_0_9, l_0_10 = , pcall(MpCommon.CommandLineToArgv, l_0_7)
                -- DECOMPILER ERROR at PC146: Overwrote pending register: R6 in 'AssignReg'

                if not l_0_10 or isnull(R6_PC137) or type(R6_PC137) ~= "table" or isnull(R6_PC137) then
                  return mp.CLEAN
                end
                if #MpCommon.CommandLineToArgv == 1 or (MpCommon.CommandLineToArgv)[1] == nil then
                  return mp.CLEAN
                end
                local l_0_11, l_0_12 = , (bm.get_process_relationships)()
                for l_0_16,l_0_17 in ipairs(l_0_12) do
                  local l_0_13 = R6_PC137
                  -- DECOMPILER ERROR at PC169: Confused about usage of register: R11 in 'UnsetPending'

                  if R11_PC169.image_path ~= nil and (mp.bitand)(R11_PC169.reason_ex, 1) == 1 and (string.lower)((string.sub)(R11_PC169.image_path, -13)) == "\\explorer.exe" then
                    l_0_9 = true
                    break
                  end
                end
                do
                  if not l_0_9 then
                    return mp.CLEAN
                  end
                  local l_0_18 = l_0_13
                  -- DECOMPILER ERROR at PC205: Overwrote pending register: R7 in 'AssignReg'

                  -- DECOMPILER ERROR at PC212: Overwrote pending register: R7 in 'AssignReg'

                  -- DECOMPILER ERROR at PC216: Confused about usage of register: R7 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC219: Overwrote pending register: R0 in 'AssignReg'

                  if ((StringEndsWith(l_0_8, "cmd.exe") and not StringEndsWith(l_0_8, "powershell.exe")) or nil) and not l_0_7 then
                    return mp.CLEAN
                  end
                  local l_0_19 = nil
                  local l_0_20 = contains
                  local l_0_21 = l_0_7
                  l_0_20 = l_0_20(l_0_21, {".ps1", ".hta"})
                  if l_0_20 then
                    l_0_20 = mp
                    l_0_20 = l_0_20.CLEAN
                    return l_0_20
                  end
                  l_0_20 = MpCommon
                  l_0_20 = l_0_20.StringRegExpSearch
                  l_0_21 = "(https?:\\/\\/[^\\s\\x22\\x27]+)"
                  l_0_20 = l_0_20(l_0_21, l_0_7)
                  if not l_0_20 then
                    return mp.CLEAN
                  end
                  if not l_0_21 then
                    return mp.CLEAN
                  end
                  local l_0_22 = {".activitydmy/", ".bet/", ".biz/", ".blog/", ".bond/", ".buzz/", ".cam/", ".cda/", ".click/", ".club/", ".country/", ".culture/", ".cyou/", ".dat/", ".digital/", ".download/", ".employerdbz/", ".eps/", ".forest/", ".flv/", ".fun/", ".gdn/", ".hair/", ".help/", ".icu/", ".info/", ".lat/", ".life/", ".link/", ".loan/", ".live/", ".m4a/", ".mdb/", ".me/", ".mp3/", ".mp4/", ".my/", ".online/", ".org/", ".party/", ".pro/", ".pw/", ".racing/", ".ren/", ".reise/", ".review/", ".run/", ".sbs/", ".science/", ".shop/", ".site/", ".space/", ".store/", ".stream/", ".study/", ".tech/", ".technology/", ".terrifyenyb/", ".today/", ".top/", ".vip/", ".work/", ".world/", ".xll/", ".xyz/", ".yokohama/"}
                  if contains(R15_PC363, l_0_22) and (contains(R15_PC363, {"iex", "iwr", "http", "irm", "curl", "invoke-restmethod", "invoke-webrequest", "invoke-expression", "windowsinstaller.installer", "start-process", "verif", " ray", " recaptcha", " re captcha", " rcaptcha", "press enter", " clip free", " over free", "robot: r", "robot - r", "robot - cloudflare", "robot: cloudflare", "robot: captcha", "robot - captcha", "human - r", "human: r", "human: captcha", "human - captcha", "microsoft windows: fix internet dns service reconnect", "restart dns service in the microsoft windows system", "# ", "identificate"}) or (MpCommon.StringRegExpSearch)("-w[indowstyle]*\\s+(?:h[iden]*|1)\\s+", l_0_7)) then
                    return mp.INFECTED
                  end
                  return mp.CLEAN
                end
              end
            end
          end
        end
      end
    end
  end
end

