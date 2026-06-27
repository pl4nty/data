-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\152b3a81d9c1f\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = ""
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 then
  l_0_0 = (string.lower)((this_sigattrlog[1]).utf8p2)
else
  if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 then
    l_0_0 = (string.lower)((this_sigattrlog[2]).utf8p2)
  else
    if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p2 then
      l_0_0 = (string.lower)((this_sigattrlog[3]).utf8p2)
    else
      if (this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p2 then
        l_0_0 = (string.lower)((this_sigattrlog[4]).utf8p2)
      else
        if (this_sigattrlog[5]).matched and (this_sigattrlog[5]).utf8p2 then
          l_0_0 = (string.lower)((this_sigattrlog[5]).utf8p2)
        end
      end
    end
  end
end
local l_0_1 = ""
if (this_sigattrlog[6]).matched and (this_sigattrlog[6]).utf8p2 then
  l_0_1 = (string.lower)((this_sigattrlog[6]).utf8p2)
else
  if (this_sigattrlog[7]).matched and (this_sigattrlog[7]).utf8p2 then
    l_0_1 = (string.lower)((this_sigattrlog[7]).utf8p2)
  else
    if (this_sigattrlog[8]).matched and (this_sigattrlog[8]).utf8p2 then
      l_0_1 = (string.lower)((this_sigattrlog[8]).utf8p2)
    end
  end
end
local l_0_2 = {}
-- DECOMPILER ERROR at PC151: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC152: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC153: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC154: Overwrote pending register: R5 in 'AssignReg'

if not ("npm install")("npm i ", "npm ci") then
  return mp.CLEAN
end
local l_0_3 = {}
-- DECOMPILER ERROR at PC164: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC165: No list found for R3 , SetList fails

-- DECOMPILER ERROR at PC166: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC167: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC168: Overwrote pending register: R6 in 'AssignReg'

if not ("tools/setup")("scripts/setup", "yarn install") then
  return mp.CLEAN
end
local l_0_4 = {}
-- DECOMPILER ERROR at PC178: Overwrote pending register: R7 in 'AssignReg'

-- DECOMPILER ERROR at PC179: Overwrote pending register: R8 in 'AssignReg'

-- DECOMPILER ERROR at PC181: No list found for R4 , SetList fails

-- DECOMPILER ERROR at PC182: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC183: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC184: Overwrote pending register: R7 in 'AssignReg'

if ("node_modules/node-gyp/")("node_modules/node-sass/", "pnpm install") then
  return mp.CLEAN
end
local l_0_5 = {}
-- DECOMPILER ERROR at PC194: Overwrote pending register: R8 in 'AssignReg'

-- DECOMPILER ERROR at PC195: No list found for R5 , SetList fails

-- DECOMPILER ERROR at PC196: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC197: Overwrote pending register: R7 in 'AssignReg'

-- DECOMPILER ERROR at PC198: Overwrote pending register: R8 in 'AssignReg'

if ("npm install --workspaces")("pnpm -r install", "pnpm i ") then
  return mp.CLEAN
end
local l_0_6, l_0_7 = pcall(reportBmInfo)
-- DECOMPILER ERROR at PC214: Overwrote pending register: R9 in 'AssignReg'

if not l_0_6 and l_0_7 then
  (bm.add_related_string)("node_modules/canvas/", tostring(l_0_7), bm.RelatedStringBMReport)
end
return mp.INFECTED

