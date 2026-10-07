-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\6eb3de6d0251\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = this_sigattrlog[1]
if isnull(l_0_0) or not l_0_0.matched then
  return mp.CLEAN
end
local l_0_1 = l_0_0.utf8p2
if isnull(l_0_1) or type(l_0_1) ~= "string" or #l_0_1 > 32768 then
  set_research_data("SC_Oidc_Error", "CommandUnavailableOrOversize", true)
  return mp.CLEAN
end
local l_0_2, l_0_3 = pcall(MpCommon.CommandLineToArgv, l_0_1)
if not l_0_2 or isnull(l_0_3) or type(l_0_3) ~= "table" or #l_0_3 > 256 then
  set_research_data("SC_Oidc_Error", "ArgumentParseFailed", true)
  return mp.CLEAN
end
for l_0_7,l_0_8 in ipairs(l_0_3) do
  if type(l_0_8) ~= "string" then
    set_research_data("SC_Oidc_Error", "InvalidArgumentType", true)
    return mp.CLEAN
  end
end
local l_0_9 = function(l_1_0)
  -- function num : 0_0
  return (string.gsub)(l_1_0, "%%(%x%x)", function(l_2_0)
    -- function num : 0_0_0
    local l_2_1 = string.char
    do
      local l_2_2, l_2_3, l_2_4 = tonumber(l_2_0, 16), .end
      do return l_2_1(l_2_2, l_2_3, l_2_4) end
      -- DECOMPILER ERROR at PC8: Confused about usage of register R2 for local variables in 'ReleaseLocals'

    end
  end
)
end

local l_0_11 = function(l_2_0)
  -- function num : 0_1 , upvalues : l_0_9
  local l_2_1, l_2_2, l_2_3, l_2_4 = (string.match)(l_2_0, "^(%a+)://([^/]+)(/[^?]*)%?(.*)$")
  if isnull(l_2_1) or (string.lower)(l_2_1) ~= "https" then
    return false
  end
  local l_2_5 = (string.lower)(l_2_2)
  l_2_5 = (string.gsub)(l_2_5, ":443$", "")
  if isnull((string.match)(l_2_5, "^[%w%-][%w%.%-]*%.actions%.githubusercontent%.com$")) then
    return false
  end
  if (string.sub)(l_2_3, -8) ~= "/idtoken" and not (string.find)(l_2_3, "/idtoken/", 1, true) then
    return false
  end
  l_2_4 = (string.match)(l_2_4, "^[^#]*")
  local l_2_6 = 0
  local l_2_7 = false
  for l_2_11,l_2_12 in (string.gmatch)("&" .. l_2_4, "&([^=&]+)=([^&]*)") do
    if l_0_9(l_2_11) == "audience" then
      l_2_6 = l_2_6 + 1
      l_2_7 = l_0_9(l_2_12) == "api://AzureADTokenExchange"
    end
  end
  do
    do
      if l_2_6 == 1 then
        local l_2_13 = l_2_7
      end
      do return false end
      -- DECOMPILER ERROR: 4 unprocessed JMP targets
    end
  end
end

local l_0_12 = function(l_3_0)
  -- function num : 0_2
  return not isnull((string.match)((string.lower)(l_3_0), "^%s*authorization%s*:%s*bearer%s+%S"))
end

local l_0_13 = {["-o"] = true, ["--output"] = true, ["-w"] = true, ["--write-out"] = true, ["-A"] = true, ["--user-agent"] = true, ["-e"] = true, ["--referer"] = true, ["-u"] = true, ["--user"] = true, ["-x"] = true, ["--proxy"] = true, ["-X"] = true, ["--request"] = true, ["--resolve"] = true, ["--connect-to"] = true, ["--cacert"] = true, ["--cert"] = true, ["--key"] = true, ["--interface"] = true, ["-m"] = true, ["--max-time"] = true, ["--connect-timeout"] = true, ["--retry"] = true, ["-d"] = true, ["--data"] = true, ["--data-raw"] = true, ["--data-binary"] = true, ["--data-urlencode"] = true, ["-F"] = true, ["--form"] = true}
local l_0_14 = false
local l_0_15 = false
while 1 do
  while 1 do
    while 1 do
      while 1 do
        while 1 do
          while 1 do
            -- DECOMPILER ERROR at PC124: Confused about usage of register: R10 in 'UnsetPending'

            if 2 <= #l_0_3 then
              local l_0_16 = nil
              -- DECOMPILER ERROR at PC127: Confused about usage of register: R11 in 'UnsetPending'

              -- DECOMPILER ERROR at PC129: Confused about usage of register: R11 in 'UnsetPending'

              if l_0_3[2] == "-H" or l_0_3[2] == "--header" or l_0_3[2] == "--url" then
                local l_0_17 = nil
                if isnull(l_0_3[l_0_16 + 1]) then
                  return mp.CLEAN
                end
                -- DECOMPILER ERROR at PC146: Confused about usage of register: R12 in 'UnsetPending'

                if l_0_17 == "--url" then
                  if not l_0_15 then
                    do
                      l_0_15 = l_0_11(l_0_3[l_0_16 + 1])
                      -- DECOMPILER ERROR at PC153: Confused about usage of register: R12 in 'UnsetPending'

                      if not l_0_14 then
                        l_0_14 = l_0_12(l_0_3[l_0_16 + 1])
                      end
                      l_0_16 = l_0_16 + 2
                      -- DECOMPILER ERROR at PC157: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC157: LeaveBlock: unexpected jumping out IF_STMT

                      -- DECOMPILER ERROR at PC157: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC157: LeaveBlock: unexpected jumping out IF_STMT

                      -- DECOMPILER ERROR at PC157: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC157: LeaveBlock: unexpected jumping out IF_STMT

                      -- DECOMPILER ERROR at PC157: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC157: LeaveBlock: unexpected jumping out IF_STMT

                    end
                  end
                end
              end
            end
          end
          -- DECOMPILER ERROR at PC160: Confused about usage of register: R11 in 'UnsetPending'

          -- DECOMPILER ERROR at PC171: Confused about usage of register: R11 in 'UnsetPending'

          if (string.sub)(l_0_17, 1, 2) == "-H" then
            if not l_0_14 then
              l_0_14 = l_0_12((string.sub)(l_0_17, 3))
            end
            l_0_16 = l_0_16 + 1
            -- DECOMPILER ERROR at PC177: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC177: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
        -- DECOMPILER ERROR at PC180: Confused about usage of register: R11 in 'UnsetPending'

        -- DECOMPILER ERROR at PC191: Confused about usage of register: R11 in 'UnsetPending'

        if (string.sub)(l_0_17, 1, 9) == "--header=" then
          if not l_0_14 then
            l_0_14 = l_0_12((string.sub)(l_0_17, 10))
          end
          l_0_16 = l_0_16 + 1
          -- DECOMPILER ERROR at PC197: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC197: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
      -- DECOMPILER ERROR at PC200: Confused about usage of register: R11 in 'UnsetPending'

      -- DECOMPILER ERROR at PC211: Confused about usage of register: R11 in 'UnsetPending'

      if (string.sub)(l_0_17, 1, 6) == "--url=" then
        if not l_0_15 then
          l_0_15 = l_0_11((string.sub)(l_0_17, 7))
        end
        l_0_16 = l_0_16 + 1
        -- DECOMPILER ERROR at PC217: LeaveBlock: unexpected jumping out IF_THEN_STMT

        -- DECOMPILER ERROR at PC217: LeaveBlock: unexpected jumping out IF_STMT

      end
    end
    -- DECOMPILER ERROR at PC218: Confused about usage of register: R11 in 'UnsetPending'

    if l_0_13[l_0_17] then
      if isnull(l_0_3[l_0_16 + 1]) then
        return mp.CLEAN
      end
      l_0_16 = l_0_16 + 2
      -- DECOMPILER ERROR at PC231: LeaveBlock: unexpected jumping out IF_THEN_STMT

      -- DECOMPILER ERROR at PC231: LeaveBlock: unexpected jumping out IF_STMT

    end
  end
  -- DECOMPILER ERROR at PC234: Confused about usage of register: R11 in 'UnsetPending'

  -- DECOMPILER ERROR at PC243: Confused about usage of register: R11 in 'UnsetPending'

  if (string.sub)(l_0_17, 1, 1) ~= "-" and not l_0_15 then
    l_0_15 = l_0_11(l_0_17)
  end
  l_0_16 = l_0_16 + 1
end
do
  do
    if not l_0_14 or not l_0_15 then
      return mp.CLEAN
    end
    ;
    (bm.add_related_string)("OidcContext", "GitHubActionsAzureAudience", bm.RelatedStringBMReport)
    do return mp.INFECTED end
    -- DECOMPILER ERROR at PC265: freeLocal<0 in 'ReleaseLocals'

  end
end

