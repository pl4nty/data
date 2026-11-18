-- Threat: !InfrastructureShared
-- Name: 6241c4dddad3
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local function l_0_0()
  reportHeaders({"Host", "User-Agent"})
  
  local l_1_0 = this_sigattrlog[1].utf8p1
  local l_1_1 = this_sigattrlog[1].np2
  local l_1_2 = this_sigattrlog[2]
  local l_1_3 = this_sigattrlog[3]
  local l_1_4 = nri.GetURI()
  if not (l_1_2.utf8p1 and l_1_2.utf8p2) or not l_1_3.utf8p1 then
    mp.changedetectionname(805306718)
    return mp.INFECTED
  end
  local l_1_5 = {}
  l_1_5.SIG_CONTEXT = string.format("NP:%s:%d", l_1_2.utf8p1, l_1_2.np2)
  l_1_5.CONTENT_SOURCE = "NP"
  l_1_5.PROCESS_PATH = l_1_3.utf8p1
  l_1_5.C2 = "true"
  local l_1_6 = l_1_0 .. ":" .. l_1_1
  local l_1_7 = mp.GetUrlReputation({l_1_6, l_1_4}, l_1_5)
  if not l_1_7 then
    mp.changedetectionname(805306719)
    return mp.INFECTED
  else
    local l_1_8 = {
      emotet = 805306695,
      trickbot = 805306697,
      dridex = 805306705,
      cobaltstrike = 805306707,
      qakbot = 805306709,
      zloader = 805306711,
      icedid = 805306713
    }
    local l_1_9 = l_1_7.urls
    for l_1_10, l_1_11 in ipairs(l_1_9) do
      if l_1_11.determination == 2 then
        local l_1_12 = l_1_11.urlresponsecontext
        if l_1_12 then
          local l_1_13 = ""
          for l_1_14, l_1_15 in ipairs(l_1_12) do
            local l_1_16 = l_1_15.key
            local l_1_17 = l_1_15.value
            if l_1_16 == "MaceFamily" then
              l_1_13 = string.lower(l_1_17)
              break
            end
          end
          if l_1_13 ~= "" then
            local l_1_18 = l_1_8[l_1_13]
            if l_1_11.confidence ~= 99 then
              l_1_18 = l_1_18 - 1
            end
            mp.changedetectionname(l_1_18)
            return mp.INFECTED
          end
        end
      end
    end
  end
end

local l_0_1, l_0_2 = pcallEx("adjustDetectionName", l_0_0)
if not l_0_1 then
  reportPcallEx()
end
return mp.INFECTED
