-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTrojanPDFFakeCaptcha\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
local l_0_1 = l_0_0 - 70
;
(mp.readprotection)(false)
local l_0_2 = tostring((mp.readfile)(l_0_1, 20))
l_0_2 = (string.lower)(l_0_2)
local l_0_3 = l_0_2:match("/prev%s+(%d+)")
if l_0_3 then
  l_0_3 = tonumber(l_0_3)
end
local l_0_4 = (mp.readfile)(l_0_3, 2048)
local l_0_5, l_0_6 = l_0_4:match("(%d)%s+(%d+)")
local l_0_7 = tonumber
do
  l_0_7 = l_0_7(l_0_6 or 0)
  l_0_6 = l_0_7
  if not l_0_6 and l_0_6 == 0 then
    l_0_7 = mp
    l_0_7 = l_0_7.CLEAN
    return l_0_7
  end
  if l_0_6 > 100 then
    l_0_6 = 100
  end
  l_0_7 = 1
  for l_0_12,l_0_13,i_3 in l_0_4:gmatch("(%d%d%d%d%d%d%d%d%d%d)%s+(%d+)%s+([nf])") do
    if i_3 == "n" then
      l_0_12 = l_0_12:gsub("^0+", "")
      if (string.find)((string.lower)((mp.readfile)(l_0_12, 30)), "/type/annot", 1, true) ~= nil then
        local l_0_15 = nil
        -- DECOMPILER ERROR at PC105: Confused about usage of register: R15 in 'UnsetPending'

        -- DECOMPILER ERROR at PC114: Confused about usage of register: R15 in 'UnsetPending'

        -- DECOMPILER ERROR at PC123: Confused about usage of register: R15 in 'UnsetPending'

        -- DECOMPILER ERROR at PC132: Confused about usage of register: R15 in 'UnsetPending'

        -- DECOMPILER ERROR at PC141: Confused about usage of register: R15 in 'UnsetPending'

        -- DECOMPILER ERROR at PC150: Confused about usage of register: R15 in 'UnsetPending'

        -- DECOMPILER ERROR at PC159: Confused about usage of register: R15 in 'UnsetPending'

        -- DECOMPILER ERROR at PC168: Confused about usage of register: R15 in 'UnsetPending'

        -- DECOMPILER ERROR at PC177: Confused about usage of register: R15 in 'UnsetPending'

        -- DECOMPILER ERROR at PC186: Confused about usage of register: R15 in 'UnsetPending'

        -- DECOMPILER ERROR at PC195: Confused about usage of register: R15 in 'UnsetPending'

        -- DECOMPILER ERROR at PC204: Confused about usage of register: R15 in 'UnsetPending'

        -- DECOMPILER ERROR at PC213: Confused about usage of register: R15 in 'UnsetPending'

        -- DECOMPILER ERROR at PC222: Confused about usage of register: R15 in 'UnsetPending'

        -- DECOMPILER ERROR at PC231: Confused about usage of register: R15 in 'UnsetPending'

        -- DECOMPILER ERROR at PC240: Confused about usage of register: R15 in 'UnsetPending'

        -- DECOMPILER ERROR at PC249: Confused about usage of register: R15 in 'UnsetPending'

        -- DECOMPILER ERROR at PC258: Confused about usage of register: R15 in 'UnsetPending'

        if (string.find)((string.lower)((mp.readfile)(l_0_12, 1200)), "/a<</s/uri\n/uri(http", 1, true) ~= nil and (string.find)((string.lower)((mp.readfile)(l_0_12, 1200)), "/type/action>>\n/subtype/link>>", 1, true) ~= nil then
          if (string.find)((string.lower)((mp.readfile)(l_0_12, 1200)), "http%a%://%w+%.zuwufag%.com/", 1, false) ~= nil or (string.find)((string.lower)((mp.readfile)(l_0_12, 1200)), "http%a%://%w+%.godoxevez%.com/", 1, false) ~= nil or (string.find)((string.lower)((mp.readfile)(l_0_12, 1200)), "http%a%://%w+%.tugoduzak%.com/", 1, false) ~= nil or (string.find)((string.lower)((mp.readfile)(l_0_12, 1200)), "http%a%://%w+%.nurepikis%.com/", 1, false) ~= nil or (string.find)((string.lower)((mp.readfile)(l_0_12, 1200)), "http%a%://%w+%.gonujovux%.com/", 1, false) ~= nil or (string.find)((string.lower)((mp.readfile)(l_0_12, 1200)), "http%a%://%w+%.maxudijuz%.com/", 1, false) ~= nil or (string.find)((string.lower)((mp.readfile)(l_0_12, 1200)), "http%a%://%w+%.pofezaf%.com/", 1, false) ~= nil or (string.find)((string.lower)((mp.readfile)(l_0_12, 1200)), "http%a%://%w+%.dutabuz%.com/", 1, false) ~= nil or (string.find)((string.lower)((mp.readfile)(l_0_12, 1200)), "http%a%://%w+%.bebopim%.com/", 1, false) ~= nil or (string.find)((string.lower)((mp.readfile)(l_0_12, 1200)), "http%a%://%w+%.vimemug%.com/", 1, false) ~= nil or (string.find)((string.lower)((mp.readfile)(l_0_12, 1200)), "http%a%://%w+%.lovali%.co%.za/", 1, false) ~= nil or (string.find)((string.lower)((mp.readfile)(l_0_12, 1200)), "http%a%://%w+%.riwitamo%.com/", 1, false) ~= nil or (string.find)((string.lower)((mp.readfile)(l_0_12, 1200)), "http%a%://%w+%.muvemisavo%.com/", 1, false) ~= nil or (string.find)((string.lower)((mp.readfile)(l_0_12, 1200)), "http%a%://%w+%.yftejum%.com/", 1, false) ~= nil or (string.find)((string.lower)((mp.readfile)(l_0_12, 1200)), "http%a%://%w+%.pifazoveju%.com/", 1, false) ~= nil or (string.find)((string.lower)((mp.readfile)(l_0_12, 1200)), "http%a%://%w+%.bovetewa%.com/", 1, false) ~= nil or (string.find)((string.lower)((mp.readfile)(l_0_12, 1200)), "http%a%://%w+%.jufewine%.com/", 1, false) ~= nil then
            (mp.set_mpattribute)("LUA:PDF/FakeCaptcha.AA")
            return mp.INFECTED
          end
          return mp.INFECTED
        end
      end
    end
    do
      do
        l_0_7 = l_0_7 + 1
        if l_0_6 < l_0_7 then
          break
        end
        -- DECOMPILER ERROR at PC279: LeaveBlock: unexpected jumping out DO_STMT

      end
    end
  end
  do return mp.CLEAN end
  -- DECOMPILER ERROR at PC284: freeLocal<0 in 'ReleaseLocals'

end

