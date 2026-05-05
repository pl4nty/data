-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\12d412284aa46\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = {}
local l_0_1 = (nri.GetRawRequestBlob)()
local l_0_2 = (nri.GetRawResponseBlob)()
if not l_0_1 then
  return mp.CLEAN
end
local l_0_3 = (string.lower)(l_0_1)
do
  local l_0_4, l_0_6 = l_0_1:match("^(%u+)%s+([^%s]+)%s+HTTP/") or ""
  -- DECOMPILER ERROR at PC22: Confused about usage of register: R5 in 'UnsetPending'

  do
    local l_0_5, l_0_7 = , l_0_6 or ""
    -- DECOMPILER ERROR at PC27: Confused about usage of register: R5 in 'UnsetPending'

    local l_0_8 = nil
    local l_0_14 = nil
    local l_0_15 = nil
    local l_0_16 = (string.find)((string.lower)(l_0_7), "/login/?login_only=1", 1, true) ~= nil
    if l_0_1:match("[Aa]uthorization:%s*[Bb]asic%s+([A-Za-z0-9+/=]+)") then
      for l_0_20,l_0_21 in ipairs({"dXNlcj1yb290", "aGFzcm9vdD0x", "dGZhX3ZlcmlmaWVkPTE", "c3VjY2Vzc2Z1bF9pbnRlcm5hbF9hdXRoX3dpdGhfdGltZXN0YW1w"}) do
        local l_0_17, l_0_18, l_0_19, l_0_20 = (string.find)(l_0_3, "%0a", 1, true) ~= nil or (string.find)(l_0_3, "\n", 1, true) ~= nil, 0
        -- DECOMPILER ERROR at PC79: Confused about usage of register: R16 in 'UnsetPending'

        if (string.find)(l_0_18, R16_PC79, 1, true) ~= nil then
          l_0_20 = l_0_20 + 1
        end
      end
    end
    -- DECOMPILER ERROR at PC88: Confused about usage of register: R8 in 'UnsetPending'

    -- DECOMPILER ERROR at PC92: Confused about usage of register: R11 in 'UnsetPending'

    do
      local l_0_23, l_0_25, l_0_28 = nil
      local l_0_31 = nil
      do
        if l_0_2 then
          local l_0_32 = nil
          -- DECOMPILER ERROR at PC161: Overwrote pending register: R15 in 'AssignReg'

        end
        do
          if not (((string.find)((string.lower)(l_0_2), " 200", 1, true) ~= nil or (string.find)((string.lower)(l_0_2), " 302", 1, true) ~= nil or (string.find)((string.lower)(l_0_2), " 307", 1, true) ~= nil) and (l_0_17 and l_0_16) or l_0_20 >= 2) or (string.find)(l_0_15, "/scripts2/", 1, true) ~= nil or (string.find)(l_0_15, "/json-api/", 1, true) ~= nil or (string.find)(l_0_15, "/cpsess", 1, true) ~= nil then
            return mp.CLEAN
          end
          -- DECOMPILER ERROR at PC179: Confused about usage of register: R12 in 'UnsetPending'

          -- DECOMPILER ERROR at PC186: Confused about usage of register: R13 in 'UnsetPending'

          -- DECOMPILER ERROR at PC193: Confused about usage of register: R14 in 'UnsetPending'

          l_0_0.resp_ok_or_30x = tostring(0)
          l_0_0.method = l_0_8
          l_0_0.path = l_0_14:sub(1, 120)
          l_0_0.useragent = (nri.GetHttpRequestHeader)("User-Agent") or ""
          l_0_0.cookie = (nri.GetHttpRequestHeader)("Cookie") or ""
          -- DECOMPILER ERROR at PC228: Confused about usage of register: R11 in 'UnsetPending'

          l_0_0.auth_hits = tostring(l_0_20)
          -- DECOMPILER ERROR at PC231: Confused about usage of register: R9 in 'UnsetPending'

          -- DECOMPILER ERROR at PC233: Confused about usage of register: R9 in 'UnsetPending'

          if l_0_32 then
            l_0_0.auth_b64_prefix = l_0_32:sub(1, 120)
          end
          l_0_0.NRI_RequestBlob = tohex(l_0_1)
          if l_0_2 then
            l_0_0.NRI_ResponseBlob = tohex(l_0_2)
          end
          ;
          (nri.AddTelemetry)((mp.bitor)((mp.bitor)(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), nri.Telemetry_QUERY), l_0_0)
          do return mp.INFECTED end
          -- DECOMPILER ERROR at PC267: freeLocal<0 in 'ReleaseLocals'

          -- DECOMPILER ERROR: 25 unprocessed JMP targets
        end
      end
    end
  end
end

