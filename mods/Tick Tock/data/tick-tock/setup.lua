
wideScreen = (26 * 6) + 4
curPlayer = 'indigo1'
offset = 15
uiOffset = 160
baseX = 0
baseY = 0
anims = {'idle', 'left', 'down', 'up', 'right'}
anims2 = {'left', 'down', 'up', 'right'}
animsAlt = {'idle', 'left', 'down', 'up', 'right', 'alt-left', 'alt-down', 'alt-up', 'alt-right'}
pD = '1'
oD = '1'
clones = 0
clonesO2 = {}
moveDaTarget = true
decision = ''

function onCreate()
	math.randomseed(os.time())
	setProperty('skipCountdown', true)
	precacheImage('characters/indigo1')
	precacheImage('characters/indigo2')
	precacheImage('characters/copy')

    makeLuaSprite('thingy', '', -500, 0)
    makeGraphic('thingy', 2500, 2500, '000000')
	setObjectCamera('thingy', 'camGame')
    addLuaSprite('thingy', true)

	makeLuaSprite('ovR', '', -20, -10)
    makeGraphic('ovR', 180, 740, '000000')
	setObjectCamera('ovR', 'other')
    addLuaSprite('ovR', true)

	makeLuaSprite('ovL', '', 1120, -10)
    makeGraphic('ovL', 180, 740, '000000')
	setObjectCamera('ovL', 'other')
    addLuaSprite('ovL', true)

	makeLuaSprite('box', 'box', 240 + uiOffset, 29)
	setObjectCamera('box', 'hud')
	scaleObject('box', 0.79, 0.58)
	setProperty('box.alpha', 0)
    addLuaSprite('box')

	makeLuaSprite('yes', 'yes', 100 + uiOffset, 920)
	setObjectCamera('yes', 'hud')
    addLuaSprite('yes')

	makeLuaSprite('no', 'no', 670 + uiOffset, 920)
	setObjectCamera('no', 'hud')
    addLuaSprite('no')

	makeLuaSprite('pointer', 'pointer', 460 + uiOffset, 420)
	setObjectCamera('pointer', 'hud')
	scaleObject('pointer', 2.5, 2.5)
	setProperty('pointer.alpha', 0)
	setProperty('pointer.antialiasing', false)
    addLuaSprite('pointer')

	makeAnimatedLuaSprite('question', 'question', 245 + uiOffset, -409)
	setObjectCamera('question', 'hud')
	scaleObject('question', 0.75, 0.75)
	addAnimationByPrefix('question', 'idle', 'question idle', 16, false)
    addLuaSprite('question')

	if downscroll then
		setProperty('scoreTxt.y', 5)
		makeLuaSprite('hpBox', 'pixelUI/me', 480 - 56 + uiOffset, 30)
		makeLuaText('hpNum1', '1', 300, 330 + uiOffset, 71)
		makeLuaText('hpNum2', '0', 300, 347 + uiOffset, 71)
		makeLuaText('hpNum3', '0', 300, 363 + uiOffset, 71)
		makeLuaText('dumNum', '0 0 0', 300, 347 + uiOffset, 103)
	else
		makeLuaSprite('hpBox', 'pixelUI/me', 480 - 56 + uiOffset, 560)
		makeLuaText('hpNum1', '1', 300, 330 + uiOffset, 601)
		makeLuaText('hpNum2', '0', 300, 347 + uiOffset, 601)
		makeLuaText('hpNum3', '0', 300, 363 + uiOffset, 601)
		makeLuaText('dumNum', '0 0 0', 300, 347 + uiOffset, 633)
	end
	setObjectCamera('hpBox', 'hud')
	scaleObject('hpBox', 2, 2)
	setProperty('hpBox.antialiasing', false)
	setObjectOrder('hpNum1', 0)
	setProperty('hpBox.alpha', 0)
    addLuaSprite('hpBox')

	setTextBorder('hpNum1', 0, '000000')
    setTextColor('hpNum1', '000000')
	setTextSize('hpNum1', 30)
	setProperty('hpNum1.alpha', 0)
	addLuaText('hpNum1')
	setTextBorder('hpNum2', 0, '000000')
    setTextColor('hpNum2', '000000')
	setTextSize('hpNum2', 30)
	setProperty('hpNum2.alpha', 0)
	addLuaText('hpNum2')
	setTextBorder('hpNum3', 0, '000000')
    setTextColor('hpNum3', '000000')
	setTextSize('hpNum3', 30)
	setProperty('hpNum3.alpha', 0)
	addLuaText('hpNum3')

	setTextBorder('dumNum', 0, '000000')
    setTextColor('dumNum', '000000')
	setTextSize('dumNum', 30)
	setProperty('dumNum.alpha', 0)
	addLuaText('dumNum')
	setObjectOrder('hpNum1', getObjectOrder('hpBox') + 1)
	setObjectOrder('hpNum2', getObjectOrder('hpBox') + 1)
	setObjectOrder('hpNum3', getObjectOrder('hpBox') + 1)
	setObjectOrder('dumNum', getObjectOrder('hpBox') + 1)

	makeLuaSprite('evOverlay', '', -500, 0)
	makeGraphic('evOverlay', 2500, 2500, 'FFFFFF')
	setProperty('evOverlay.visible', false)
    addLuaSprite('evOverlay')

	makeAnimatedLuaSprite('wavyBG', 'backgrounds/waves', -200, -200)
	addAnimationByPrefix('wavyBG', 'idle', 'waves idle', 24, true)
	scaleObject('wavyBG', 4, 4)
	setScrollFactor('wavyBG', 0, 0)
	setProperty('wavyBG.antialiasing', false)
	setProperty('wavyBG.visible', false)
	playAnim('wavyBG', 'idle')
	addLuaSprite('wavyBG')

	makeAnimatedLuaSprite('circle', 'backgrounds/circle', 10, -360)
	addAnimationByPrefix('circle', 'idle', 'circle idle', 24, true)
	scaleObject('circle', 2.7, 2.7)
	setProperty('circle.antialiasing', false)
	setProperty('circle.angle', 90)
	setScrollFactor('circle', 0, 0)
	--setProperty('circle.visible', false)
	playAnim('circle', 'idle')
	addLuaSprite('circle')

	makeAnimatedLuaSprite('giygas', 'backgrounds/giygas', -50, -200)
	addAnimationByPrefix('giygas', 'idle', 'giygas idle', 16, true)
	scaleObject('giygas', 4.5, 4.5)
	setProperty('giygas.antialiasing', false)
	setScrollFactor('giygas', 0, 0)
	setProperty('giygas.alpha', 0.3)
	setProperty('giygas.color', getColorFromHex('FF0000'))
	setProperty('giygas.visible', false)
	playAnim('giygas', 'idle')
	addLuaSprite('giygas')

	makeLuaSprite('indicator', 'box', 240, 29)
	setObjectCamera('indicator', 'hud')
	scaleObject('indicator', 0.79, 0.58)
	setProperty('indicator.alpha', 0)
    addLuaSprite('indicator')

	setProperty('boyfriend.visible', false)
	setProperty('dad.visible', false)

	makeAnimatedLuaSprite('indigo1', 'characters/indigo1', 50, 200)
	addAnimationByPrefix('indigo1', 'idle', 'indigo1 idle', 12, true)
	addAnimationByPrefix('indigo1', 'left', 'indigo1 left', 12, false)
	addAnimationByPrefix('indigo1', 'down', 'indigo1 down', 12, false)
	addAnimationByPrefix('indigo1', 'up', 'indigo1 up', 12, false)
	addAnimationByPrefix('indigo1', 'right', 'indigo1 right', 12, false)
	scaleObject('indigo1', 1.5, 1.5)
	addLuaSprite('indigo1')

	makeLuaSprite('drive', 'blueDrive', 1200, 480)
	scaleObject('drive', 1.7, 1.7)
	addLuaSprite('drive')

	if downscroll then
		setProperty('box.y', 549)
		setProperty('indicator.y', 549)
	end
end

function onCreatePost()
	setProperty("timeTxt.y", getProperty("timeTxt.y") + 10000)
	setProperty("timeBar.y", getProperty("timeBar.y") + 10000)
	setProperty("botplayTxt.y", getProperty("botplayTxt.y") + 10000)
    setProperty("healthBar.y", getProperty("healthBar.y") + 10000)
	setProperty("iconP1.visible", false)
    setProperty("iconP2.visible", false)
	for i = 0, 3 do
    	setPropertyFromGroup('opponentStrums', i, 'x', getPropertyFromGroup('opponentStrums', i, 'x') + 170 + uiOffset)
		setPropertyFromGroup('playerStrums', i, 'x', getPropertyFromGroup('playerStrums', i, 'x') - 310)
	end
	for i = 0, 7 do
        noteTweenAlpha('noteAlpha'..i, i, 0, 0.001, 'linear')
    end

	setPropertyFromClass('Main', 'fpsVar.visible', false)
	runHaxeCode([[ FlxG.mouse.visible = false; ]])

	baseX = getProperty('camFollow.x')
    baseY = getProperty('camFollow.y')

	setTextString('scoreTxt', 'SCORE: '..tostring(getProperty('songScore')))
end

function onExitSong()
	setPropertyFromClass('Main', 'fpsVar.visible', true)
	runHaxeCode([[ FlxG.mouse.visible = false; ]])
end

function onOpenChartEditor()
	setPropertyFromClass('Main', 'fpsVar.visible', true)
	runHaxeCode([[ FlxG.mouse.visible = false; ]])
end

function onOpenCharacterEditor()
	setPropertyFromClass('Main', 'fpsVar.visible', true)
	runHaxeCode([[ FlxG.mouse.visible = false; ]])
end

function onDestroy()
	setPropertyFromClass('Main', 'fpsVar.visible', true)
	runHaxeCode([[ FlxG.mouse.visible = false; ]])
end

function onUpdate(elapsed)
	noteShit()
	if curStep < 1638 then
		if mouseOverlaps('yes', 'camHUD') then
			decision = 'yes'
			doTweenX('pointerMove', 'pointer', 160 + uiOffset, 0.35, 'quadOut')
		elseif mouseOverlaps('no', 'camHUD') then
			decision = 'no'
			doTweenX('pointerMove', 'pointer', 730 + uiOffset, 0.35, 'quadOut')
		end
	end
end

function onEvent(eventName, value1, value2)
	if eventName == 'indicator' then
		if value2 == '0' then
			if value1 == 'left' then
				oD = '1'
				setProperty('indicator.x', 6 + uiOffset)
			elseif value1 == 'right' then
				oD = '2'
				setProperty('indicator.x', 474 + uiOffset)
			end
        	setProperty('indicator.alpha', 0)
		else
			if value1 == 'left' then
				oD = '5'
				setProperty('indicator.x', 6 + uiOffset)
			elseif value1 == 'right' then
				oD = '67'
				setProperty('indicator.x', 474 + uiOffset)
			end
			setProperty('indicator.alpha', 0.75)
		end
    end
	if eventName == 'switchBG' then
		if value1 == 'waves1' or value1 == 'waves2' then
			setProperty('wavyBG.visible', true)
			if value1 == 'waves1' then
				setProperty('wavyBG.color', getColorFromHex('FFFFFF'))
				setProperty('wavyBG.x', getProperty('wavyBG.x') + 200)
			else
				setProperty('wavyBG.color', getColorFromHex('FF0000'))
			end
		else
			setProperty('wavyBG.visible', false)
		end
		if value1 == 'circle1' or value1 == 'circle2' then
			setProperty('circle.visible', true)
			if value1 == 'circle1' then
				setProperty('circle.color', getColorFromHex('FFFFFF'))
			else
				setProperty('circle.color', getColorFromHex('FF0044'))
			end
		else
			setProperty('circle.visible', false)
		end
		if value1 == 'circle2' or value1 == 'waves2' then
			setProperty('giygas.visible', true)
		else
			setProperty('giygas.visible', false)
		end
	end
	if eventName == 'noteTexSwitch' then
		pD = value2
		oD = value1
	end
	if eventName == 'sonicCloneFly' then
		clones = clones + 1
		doTweenX('cloneMoveRx'..clones, 'copyclone'..clones, -600, value1, 'linear')
		doTweenY('cloneMoveRy'..clones, 'copyclone'..clones, math.random(-100, 450), value1, 'linear')
		-----------------------
		clones = clones + 1
		doTweenX('cloneMoveLx'..clones, 'copyclone'..clones, 1000, value1, 'linear')
		doTweenY('cloneMoveLy'..clones, 'copyclone'..clones, math.random(-100, 450), value1, 'linear')
	end
	if eventName == 'overlaySwitch' then
		if value1 == '' and value2 == '' then
			setProperty('evOverlay.visible', false)
			doTweenColor('playerColor', curPlayer, 'FFFFFF', 0.0000001, 'linear')
			for i = 1, #clonesP do
				doTweenColor('cloneColor'..i, clonesP[i], 'FFFFFF', 0.0000001, 'linear')
			end
		else
			setObjectOrder('evOverlay', getObjectOrder(clonesP[#clonesP]) - 1)
			doTweenColor('overlayColor', 'evOverlay', value1, 0.0000001, 'linear')
    		doTweenColor('playerColor', curPlayer, value2, 0.0000001, 'linear')
			setProperty('evOverlay.visible', true)
    		for i = 1, #clonesP do
        	doTweenColor('cloneColor'..i, clonesP[i], value2, 0.0000001, 'linear')
    		end
		end
	end
	if eventName == 'eventTrigger' then
		if value1 == '128' then
			setCamBase(660, 500)
			for i = 4, 7 do
				noteTweenAlpha('noteAlpha'..i, i, 1, 0.001, 'linear')
			end
			doTweenAlpha('boxIn', 'box', 1, 0.001, 'linear')
			doTweenAlpha('hpBoxIn', 'hpBox', 1, 0.001, 'linear')
			doTweenAlpha('hpNum1In', 'hpNum1', 1, 0.001, 'linear')
			doTweenAlpha('hpNum2In', 'hpNum2', 1, 0.001, 'linear')
			doTweenAlpha('hpNum3In', 'hpNum3', 1, 0.001, 'linear')
			doTweenAlpha('dumNumIn', 'dumNum', 1, 0.001, 'linear')
			setProperty('thingy.visible', false)
		end
		if value1 == '160' then
			setCamBase(840, 500)
			doTweenX('driveMove', 'drive', 950, 0.75, 'quadOut')
		end
		if value1 == '192' then
			setCamBase(660, 500)
			doTweenX('driveMove2', 'drive', 1200, 0.75, 'quadIn')
		end
		if value1 == '208' then
			setCamBase(480, 500)
			setProperty('drive.alpha', 0)
			setProperty('drive.x', 200)
			doTweenAlpha('driveShow', 'drive', 1, 0.75, 'linear')
		end
		if value1 == '256' then
			setCamBase(280, 500)
			doTweenX('indigo1Out', 'indigo1', 400, 0.75, 'quadIn')
			moveDaTarget = false
			curPlayer = 'none'
			playAnim('indigo1', 'idle')
		end
		if value1 == '288' then
			setCamBase(660, 500)
			doTweenX('driveMove', 'drive', -50, 1, 'quadOut')
			doTweenX('indigo1Out', 'indigo1', 50, 0.75, 'quadOut')
		end
		if value1 == '320' then
			setCamBase(540, 500)
			doTweenX('driveMove', 'drive', 300, 0.75, 'quadOut')
		end
		if value1 == '352' then
			setCamBase(660, 500)
			doTweenX('driveMove', 'drive', -50, 1, 'quadOut')
			moveDaTarget = true
			curPlayer = 'indigo1'
		end
		if value1 == '364' then
			makeAnimatedLuaSprite('indiclone1', 'characters/indigo1', getProperty('indigo1.x') + 750, getProperty('indigo1.y'))
			scaleObject('indiclone1', 1.3, 1.3)
			setProperty('indiclone1.alpha', 0.8)
			addLuaSprite('indiclone1')
			makeAnimatedLuaSprite('indiclone2', 'characters/indigo1', getProperty('indigo1.x') - 750, getProperty('indigo1.y'))
			scaleObject('indiclone2', 1.3, 1.3)
			setProperty('indiclone2.alpha', 0.8)
			addLuaSprite('indiclone2')
			for i = 1, #anims do
				addAnimationByPrefix('indiclone1', anims[i], 'indigo1 '..anims[i], 12, false)
				addAnimationByPrefix('indiclone2', anims[i], 'indigo1 '..anims[i], 12, false)
			end
			doTweenX('indiclone1move', 'indiclone1', getProperty('indigo1.x') + 410, 1.5, 'quadOut')
			doTweenX('indiclone2move', 'indiclone2', getProperty('indigo1.x') - 260, 1.5, 'quadOut')
			clonesP = {'indiclone1', 'indiclone2'}
		end
		if value1 == '384' then
			clonesP = {}
			removeLuaSprite('indiclone1', true)
			removeLuaSprite('indiclone2', true)
			curPlayer = 'indigo2'
			makeAnimatedLuaSprite('indigo2', 'characters/indigo2', 420, 340)
			scaleObject('indigo2', 0.8, 0.8)
			addLuaSprite('indigo2')
			for i = 1, #anims2 do
				addAnimationByPrefix('indigo2', anims2[i], 'indigo2 '..anims2[i], 12, false)
			end
			addAnimationByPrefix('indigo2', 'idle', 'indigo2 idle', 12, true)
			makeAnimatedLuaSprite('indiclone21', 'characters/indigo2', 420 + 250, 340)
			scaleObject('indiclone21', 0.8, 0.8)
			addLuaSprite('indiclone21')
			for i = 1, #anims2 do
				addAnimationByPrefix('indiclone21', anims2[i], 'indigo2 '..anims2[i], 12, false)
			end
			addAnimationByPrefix('indiclone21', 'idle', 'indigo2 idle', 12, true)
			makeAnimatedLuaSprite('indiclone22', 'characters/indigo2', 420 - 250, 340)
			scaleObject('indiclone22', 0.8, 0.8)
			addLuaSprite('indiclone22')
			for i = 1, #anims2 do
				addAnimationByPrefix('indiclone22', anims2[i], 'indigo2 '..anims2[i], 12, false)
			end
			addAnimationByPrefix('indiclone22', 'idle', 'indigo2 idle', 12, true)
			removeLuaSprite('indigo1', true)
			setObjectOrder('indiclone21', getObjectOrder('indigo2') - 1)
			setObjectOrder('indiclone22', getObjectOrder('indigo2') - 1)
			clonesP = {'indiclone21', 'indiclone22'}
			playAnim('indiclone21', 'idle')
			playAnim('indiclone22', 'idle')
		end
		if value1 == '512' then
			makeAnimatedLuaSprite('indiclone23', 'characters/indigo2', 420 - 250, 340)
			scaleObject('indiclone23', 0.8, 0.8)
			setProperty('indiclone23.alpha', 0.8)
			addLuaSprite('indiclone23')
			for i = 1, #anims2 do
				addAnimationByPrefix('indiclone23', anims2[i], 'indigo2 '..anims2[i], 12, false)
			end
			addAnimationByPrefix('indiclone23', 'idle', 'indigo2 idle', 12, true)
			----
			makeAnimatedLuaSprite('indiclone24', 'characters/indigo2', 420, 340)
			scaleObject('indiclone24', 0.8, 0.8)
			setProperty('indiclone24.alpha', 0.8)
			addLuaSprite('indiclone24')
			for i = 1, #anims2 do
				addAnimationByPrefix('indiclone24', anims2[i], 'indigo2 '..anims2[i], 12, false)
			end
			addAnimationByPrefix('indiclone24', 'idle', 'indigo2 idle', 12, true)
			----
			makeAnimatedLuaSprite('indiclone25', 'characters/indigo2', 420 + 250, 340)
			scaleObject('indiclone25', 0.8, 0.8)
			setProperty('indiclone25.alpha', 0.8)
			addLuaSprite('indiclone25')
			for i = 1, #anims2 do
				addAnimationByPrefix('indiclone25', anims2[i], 'indigo2 '..anims2[i], 12, false)
			end
			addAnimationByPrefix('indiclone25', 'idle', 'indigo2 idle', 12, true)
			clonesP = {'indiclone21', 'indiclone22', 'indiclone23', 'indiclone24', 'indiclone25'}
			setObjectOrder('indiclone23', getObjectOrder('indiclone21') - 1)
			setObjectOrder('indiclone24', getObjectOrder('indiclone21') - 1)
			setObjectOrder('indiclone25', getObjectOrder('indiclone21') - 1)
			doTweenY('moveClone1', 'indiclone23', 200, 0.75, 'quadOut')
			doTweenY('moveClone2', 'indiclone24', 200, 0.75, 'quadOut')
			doTweenY('moveClone3', 'indiclone25', 200, 0.75, 'quadOut')
			playAnim('indiclone23', 'idle')
			playAnim('indiclone24', 'idle')
			playAnim('indiclone25', 'idle')
		end
		if value1 == '576' then
			doTweenY('moveClone1', 'indiclone23', 340, 0.75, 'quadIn')
			doTweenY('moveClone2', 'indiclone24', 340, 0.75, 'quadIn')
			doTweenY('moveClone3', 'indiclone25', 340, 0.75, 'quadIn')
		end
		if value1 == '640' then
			clonesP = {}
			setCamBase(660, 500)
			setProperty('indigo2.y', getProperty('indigo2.y') + 400)
			removeLuaSprite('indiclone21', true)
			removeLuaSprite('indiclone22', true)
			removeLuaSprite('indiclone23', true)
			removeLuaSprite('indiclone24', true)
			removeLuaSprite('indiclone25', true)
			doTweenY('moveIndigoUp', 'indigo2', getProperty('indigo2.y') - 400, 0.75, 'quadOut')
			makeAnimatedLuaSprite('copyclone1', 'characters/copy', 420 + 575, 280)
			scaleObject('copyclone1', 1.15, 1.15)
			setProperty('copyclone1.alpha', 0.8)
			addLuaSprite('copyclone1')
			for i = 1, #animsAlt do
				addAnimationByPrefix('copyclone1', animsAlt[i], 'copy '..animsAlt[i], 12, false)
			end
			addAnimationByPrefix('copyclone1', 'idle', 'copy idle', 12, true)
			makeAnimatedLuaSprite('copyclone2', 'characters/copy', 420 - 1025, 280)
			scaleObject('copyclone2', 1.15, 1.15)
			setProperty('copyclone2.alpha', 0.8)
			addLuaSprite('copyclone2')
			for i = 1, #animsAlt do
				addAnimationByPrefix('copyclone2', animsAlt[i], 'copy '..animsAlt[i], 12, false)
			end
			addAnimationByPrefix('copyclone2', 'idle', 'copy idle', 12, true)
			playAnim('copyclone1', 'idle')
			playAnim('copyclone2', 'idle')
			doTweenX('cloneIn1', 'copyclone1', getProperty('indigo2.x') + 75, 1.5, 'quadOut')
			doTweenX('cloneIn2', 'copyclone2', getProperty('indigo2.x') - 525, 1.5, 'quadOut')
			setObjectOrder('copyclone1', getObjectOrder('indigo2') - 1)
			setObjectOrder('copyclone2', getObjectOrder('indigo2') - 1)
			clonesO = {'copyclone1', 'copyclone2'}
		end
		if value1 == '672' then
			clonesO = {}
			setCamBase(360, 500)
			doTweenAlpha('indigo2Out', 'indigo2', 0, 0.5, 'linear')
			doTweenAlpha('clone1In', 'copyclone1', 1, 0.5, 'linear')
			doTweenAlpha('clone2In', 'copyclone2', 1, 0.5, 'linear')
			curPlayer = 'copyclone1'
			clonesP = {'copyclone2'}
			clonesO = {'indiclone31'}
			makeAnimatedLuaSprite('indiclone31', 'characters/indigo2', getProperty('copyclone2.x') - 500, getProperty('copyclone1.y') + 35)
			scaleObject('indiclone31', 0.72, 0.72)
			addLuaSprite('indiclone31')
			for i = 1, #anims2 do
				addAnimationByPrefix('indiclone31', anims2[i], 'indigo2 '..anims2[i], 12, false)
			end
			addAnimationByPrefix('indiclone31', 'idle', 'indigo2 idle', 12, true)
		end
		if value1 == '685' then
			doTweenX('clone2Move', 'copyclone2', getProperty('copyclone2.x') + 150, 0.5, 'quadOut')
			doTweenX('indiclone31Move', 'indiclone31', getProperty('copyclone2.x') + 110, 0.5, 'quadOut')
			doTweenAlpha('hpBoxOut', 'hpBox', 0, 0.75, 'linear')
			doTweenAlpha('hpNum1Out', 'hpNum1', 0, 0.75, 'linear')
			doTweenAlpha('hpNum2Out', 'hpNum2', 0, 0.75, 'linear')
			doTweenAlpha('hpNum3Out', 'hpNum3', 0, 0.75, 'linear')
			doTweenAlpha('dumNumOut', 'dumNum', 0, 0.75, 'linear')
		end
		if value1 == '704' then
			setCamBase(960, 500)
			doTweenAlpha('clone2Out', 'copyclone2', 0, 0.5, 'quadOut')
		end
		if value1 == '748' then
			doTweenX('clone1Move', 'copyclone1', getProperty('copyclone1.x') + 190, 0.5, 'quadOut')
			doTweenX('indiclone31Move', 'indiclone31', getProperty('copyclone1.x') + 30, 0.5, 'quadOut')
		end
		if value1 == '768' then
			setCamBase(730, 500)
			curPlayer = 'indiclone31'
			clonesP = {}
			clonesO = {'copyclone1', 'copyclone2'}
		end
		if value1 == '896' then
			setCamBase(960, 500)
		end
		if value1 == '928' then
			setCamBase(1190, 500)
			curPlayer = 'copyclone1'
			clonesO = {'indiclone31'}
			clonesP = {'copyclone2'}
		end
		if value1 == '960' then
			setCamBase(560, 500)
			setProperty('copyclone2.alpha', 1)
			setProperty('copyclone2.x', getProperty('copyclone2.x') - 150)
			doTweenX('clone2Move', 'copyclone2', getProperty('copyclone2.x') + 100, 0.5, 'quadOut')
		end
		if value1 == '992' then
			setCamBase(730, 500)
			doTweenX('clone1Move', 'copyclone1', getProperty('copyclone1.x') - 155, 0.5, 'quadOut')
		end
		if value1 == '1024' then
			doTweenAlpha('clone1Out', 'copyclone1', 0, 1, 'linear')
			doTweenAlpha('clone2Out', 'copyclone2', 0, 1, 'linear')
			doTweenAlpha('boxOut', 'box', 0, 1, 'linear')
			for i = 4, 7 do
				noteTweenAlpha('noteOut'..i, i, 0, 1, 'linear')
			end
		end
		if value1 == '1048' then
			curPlayer = 'indiclone31'
			clonesO = {}
			removeLuaSprite('copyclone1')
			removeLuaSprite('copyclone2')
			removeLuaSprite('indigo2')
			--doTweenAlpha('boxIn', 'box', 1, 0.75, 'linear')
			for i = 4, 7 do
				doTweenColor('noteColor'..i, 'strumLineNotes.members['..i..']', '000000', 0.01, 'linear')
				noteTweenAlpha('noteIn'..i, i, 1, 0.75, 'linear')
			end
			for i = 0, 3 do
				setPropertyFromGroup('playerStrums', i, 'x', getPropertyFromGroup('playerStrums', i, 'x') + 225)
			end
			doTweenColor('fadeToBlack', 'indiclone31', '000000', 0.75, 'linear')
			makeLuaSprite('red', '', -50, -50)
			makeGraphic('red', 1500, 900, 'FF0000')
			setProperty('red.alpha', 0)
			setObjectOrder('red', getObjectOrder('giygas') + 1)
			addLuaSprite('red')
			doTweenAlpha('redIn', 'red', 1, 0.75, 'linear')
			triggerEvent('Camera Follow Pos', baseX, baseY)
			moveDaTarget = false
			makeAnimatedLuaSprite('clock', 'clock', 50, 110)
			setProperty('clock.alpha', 0)
			scaleObject('clock', 0.8, 0.8)
			setObjectOrder('clock', getObjectOrder('red') + 1)
			addLuaSprite('clock')
			addAnimationByPrefix('clock', 'idle', 'clock idle', 12, true)
			doTweenAlpha('clockIn', 'clock', 1, 0.75, 'linear')
			playAnim('clock', 'idle')
			for i = 1, 14 do
				if (i % 2 == 0) then
					makeAnimatedLuaSprite('copyclone'..i, 'characters/copy', -600, math.random(-100, 450))
				else
					makeAnimatedLuaSprite('copyclone'..i, 'characters/copy', 1000, math.random(-100, 450))
				end
				scaleObject('copyclone'..i, 1.15, 1.15)
				setProperty('copyclone'..i..'.alpha', 0.5)
				addLuaSprite('copyclone'..i)
				setObjectOrder('copyclone'..i, getObjectOrder('red')+1)
				for j = 1, #animsAlt do
					addAnimationByPrefix('copyclone'..i, animsAlt[j], 'copy '..animsAlt[j], 12, false)
				end
				addAnimationByPrefix('copyclone'..i, 'idle', 'copy idle', 12, true)
				setProperty('copyclone'..i..'.color', '000000')
				table.insert(clonesO, 'copyclone'..i)
			end
		end
		if value1 == '1168' then
			for i = 4, 7 do
				doTweenColor('noteColor'..i, 'strumLineNotes.members['..i..']', 'FFFFFF', 0.75, 'linear')
			end
			clonesO = {}
			doTweenColor('fadeToNormal', 'indiclone31', 'FFFFFF', 0.75, 'linear')
			makeLuaSprite('black', '', -600, -600)
			makeGraphic('black', 2400, 2000, '000000')
			setProperty('black.alpha', 0)
			setObjectOrder('black', getObjectOrder('red') + 1)
			addLuaSprite('black')
			doTweenAlpha('blackIn', 'black', 1, 0.75, 'linear')
			moveDaTarget = true
		end
		if value1 == '1184' then
			setCamBase(730, 480)
			noteTweenX('noteMove4', 4, 262 + uiOffset, 1, 'quadOut')
			noteTweenX('noteMove5', 5, 374 + uiOffset, 1, 'quadOut')
			noteTweenX('noteMove6', 6, 486 + uiOffset, 1, 'quadOut')
			noteTweenX('noteMove7', 7, 598 + uiOffset, 1, 'quadOut')
			
			setProperty('black.visible', false)
			cancelTween('redIn')
			setProperty('red.alpha', 0.18)
			scaleObject('wavyBG', 2.5, 3.8)
			setProperty('giygas.x', getProperty('giygas.x') + 280)
			scaleObject('giygas', 2.85, 3)
			makeAnimatedLuaSprite('clock2', 'clock', 620, 550)
			scaleObject('clock2', 0.8, 0.8)
			setProperty('clock2.flipX', true)
			setObjectOrder('clock2', getObjectOrder('red') + 1)
			addLuaSprite('clock2')
			addAnimationByPrefix('clock2', 'idle', 'clock idle', 12, true)
			playAnim('clock2', 'idle')

			setProperty('indiclone31.x', 525)

			makeAnimatedLuaSprite('indiclone41', 'characters/indigo2', getProperty('indiclone31.x') - 175, getProperty('indiclone31.y'))
			scaleObject('indiclone41', 0.72, 0.72)
			addLuaSprite('indiclone41')
			for i = 1, #anims2 do
				addAnimationByPrefix('indiclone41', anims2[i], 'indigo2 '..anims2[i], 12, false)
			end
			addAnimationByPrefix('indiclone41', 'idle', 'indigo2 idle', 12, true)
			setObjectOrder('indiclone41', getObjectOrder('indiclone31') - 1)

			makeAnimatedLuaSprite('indiclone42', 'characters/indigo2', getProperty('indiclone31.x') + 175, getProperty('indiclone31.y'))
			scaleObject('indiclone42', 0.72, 0.72)
			addLuaSprite('indiclone42')
			for i = 1, #anims2 do
				addAnimationByPrefix('indiclone42', anims2[i], 'indigo2 '..anims2[i], 12, false)
			end
			addAnimationByPrefix('indiclone42', 'idle', 'indigo2 idle', 12, true)
			setObjectOrder('indiclone42', getObjectOrder('indiclone31') + 1)
			clonesP = {'indiclone41', 'indiclone42'}
		end
		if value1 == '1248' then
			makeAnimatedLuaSprite('copyclone41', 'characters/copy', getProperty('indiclone31.x')-260-175, getProperty('indiclone31.y')-40)
			scaleObject('copyclone41', 1.15, 1.15)
			setProperty('copyclone41.alpha', 0.7)
			addLuaSprite('copyclone41')
			setObjectOrder('copyclone41', getObjectOrder('indiclone41') - 1)
			for i = 1, #animsAlt do
				addAnimationByPrefix('copyclone41', animsAlt[i], 'copy '..animsAlt[i], 12, false)
			end
			addAnimationByPrefix('copyclone41', 'idle', 'copy idle', 12, true)
			playAnim('copyclone41', 'idle')

			makeAnimatedLuaSprite('copyclone42', 'characters/copy', getProperty('indiclone31.x')-260, getProperty('indiclone31.y')-40)
			scaleObject('copyclone42', 1.15, 1.15)
			setProperty('copyclone42.alpha', 0.7)
			addLuaSprite('copyclone42')
			setObjectOrder('copyclone42', getObjectOrder('indiclone41') - 1)
			for i = 1, #animsAlt do
				addAnimationByPrefix('copyclone42', animsAlt[i], 'copy '..animsAlt[i], 12, false)
			end
			addAnimationByPrefix('copyclone42', 'idle', 'copy idle', 12, true)
			playAnim('copyclone42', 'idle')

			makeAnimatedLuaSprite('copyclone43', 'characters/copy', getProperty('indiclone31.x')-260+175, getProperty('indiclone31.y')-40)
			scaleObject('copyclone43', 1.15, 1.15)
			setProperty('copyclone43.alpha', 0.7)
			addLuaSprite('copyclone43')
			setObjectOrder('copyclone43', getObjectOrder('indiclone31') - 1)
			for i = 1, #animsAlt do
				addAnimationByPrefix('copyclone43', animsAlt[i], 'copy '..animsAlt[i], 12, false)
			end
			addAnimationByPrefix('copyclone43', 'idle', 'copy idle', 12, true)
			playAnim('copyclone43', 'idle')

			clonesO = {'copyclone41', 'copyclone42', 'copyclone43'}

			doTweenY('moveC41', 'copyclone41', getProperty('copyclone41.y') - 80, 0.75, 'quadOut')
			doTweenY('moveC42', 'copyclone42', getProperty('copyclone42.y') - 80, 0.75, 'quadOut')
			doTweenY('moveC43', 'copyclone43', getProperty('copyclone43.y') - 80, 0.75, 'quadOut')
			----------------------------------------------------------------
			makeAnimatedLuaSprite('indiclone43', 'characters/indigo2', getProperty('indiclone31.x') - 175, getProperty('indiclone31.y'))
			scaleObject('indiclone43', 0.72, 0.72)
			setProperty('indiclone43.alpha', 0.6)
			addLuaSprite('indiclone43')
			for i = 1, #anims2 do
				addAnimationByPrefix('indiclone43', anims2[i], 'indigo2 '..anims2[i], 12, false)
			end
			addAnimationByPrefix('indiclone43', 'idle', 'indigo2 idle', 12, true)
			setObjectOrder('indiclone43', getObjectOrder('copyclone41') - 1)

			makeAnimatedLuaSprite('indiclone44', 'characters/indigo2', getProperty('indiclone31.x'), getProperty('indiclone31.y'))
			scaleObject('indiclone44', 0.72, 0.72)
			setProperty('indiclone44.alpha', 0.6)
			addLuaSprite('indiclone44')
			for i = 1, #anims2 do
				addAnimationByPrefix('indiclone44', anims2[i], 'indigo2 '..anims2[i], 12, false)
			end
			addAnimationByPrefix('indiclone44', 'idle', 'indigo2 idle', 12, true)
			setObjectOrder('indiclone44', getObjectOrder('copyclone42') - 1)

			makeAnimatedLuaSprite('indiclone45', 'characters/indigo2', getProperty('indiclone31.x') + 175, getProperty('indiclone31.y'))
			scaleObject('indiclone45', 0.72, 0.72)
			setProperty('indiclone45.alpha', 0.6)
			addLuaSprite('indiclone45')
			for i = 1, #anims2 do
				addAnimationByPrefix('indiclone45', anims2[i], 'indigo2 '..anims2[i], 12, false)
			end
			addAnimationByPrefix('indiclone45', 'idle', 'indigo2 idle', 12, true)
			setObjectOrder('indiclone45', getObjectOrder('copyclone43') - 1)

			clonesP = {'indiclone41', 'indiclone42', 'indiclone43', 'indiclone44', 'indiclone45'}

			doTweenY('move43', 'indiclone43', getProperty('indiclone43.y') - 100, 0.75, 'quadOut')
			doTweenY('move44', 'indiclone44', getProperty('indiclone44.y') - 100, 0.75, 'quadOut')
			doTweenY('move45', 'indiclone45', getProperty('indiclone45.y') - 100, 0.75, 'quadOut')

			makeAnimatedLuaSprite('clock3', 'clock', 180, 920)
			scaleObject('clock3', 0.7, 0.7)
			setProperty('clock3.angle', 30)
			setObjectOrder('clock3', getObjectOrder('red') + 1)
			addLuaSprite('clock3')
			addAnimationByPrefix('clock3', 'idle', 'clock idle', 12, true)
			playAnim('clock3', 'idle')
			doTweenY('clock3In', 'clock3', 520, 0.75, 'quadOut')

			setObjectOrder('clock', getObjectOrder('indiclone43') - 1)
			setObjectOrder('clock2', getObjectOrder('indiclone43') - 1)
			setObjectOrder('clock3', getObjectOrder('indiclone43') - 1)
		end
		if value1 == '1300' then
			doTweenY('moveI43', 'indiclone43', getProperty('indiclone43.y') + 100, 0.75, 'quadOut')
			doTweenY('moveI44', 'indiclone44', getProperty('indiclone44.y') + 100, 0.75, 'quadOut')
			doTweenY('moveI45', 'indiclone45', getProperty('indiclone45.y') + 100, 0.75, 'quadOut')
			doTweenY('moveCC41', 'copyclone41', getProperty('copyclone41.y') + 80, 0.75, 'quadOut')
			doTweenY('moveCC42', 'copyclone42', getProperty('copyclone42.y') + 80, 0.75, 'quadOut')
			doTweenY('moveCC43', 'copyclone43', getProperty('copyclone43.y') + 80, 0.75, 'quadOut')
			
			doTweenAlpha('fadeI41', 'indiclone41', 0, 0.75, 'quadOut')
			doTweenAlpha('fadeI42', 'indiclone42', 0, 0.75, 'quadOut')
			doTweenAlpha('fadeI43', 'indiclone43', 0, 0.75, 'quadOut')
			doTweenAlpha('fadeI44', 'indiclone44', 0, 0.75, 'quadOut')
			doTweenAlpha('fadeI45', 'indiclone45', 0, 0.75, 'quadOut')
			doTweenAlpha('fadeCC41', 'copyclone41', 0, 0.75, 'quadOut')
			doTweenAlpha('fadeCC42', 'copyclone42', 0, 0.75, 'quadOut')
			doTweenAlpha('fadeCC43', 'copyclone43', 0, 0.75, 'quadOut')

			for i = 1, 14 do
				setProperty('copyclone'..i..'.alpha', 0)
			end
			setProperty('drive.alpha', 0)
		end
		if value1 == '1310' then
			clonesO = {'indiclone51', 'indiclone52', 'indiclone53', 'indiclone54', 'indiclone55', 'copyclone61', 'copyclone63', 'copyclone65'}
			clonesO2 = {'copyclone62', 'copyclone64'}
			setCamBase(520, 560)
			setProperty('indiclone31.x', 525)

			makeAnimatedLuaSprite('indiclone51', 'characters/indigo1', getProperty('indiclone31.x') - 200, getProperty('indiclone31.y') - 15)
			setObjectOrder('indiclone51', getObjectOrder('indiclone31') - 1)
			scaleObject('indiclone51', 1.075, 1.075)
			setProperty('indiclone51.alpha', 0)
			addLuaSprite('indiclone51')
			for i = 1, #anims do
				addAnimationByPrefix('indiclone51', anims[i], 'indigo1 '..anims[i], 12, false)
			end
			doTweenX('indiclone51move', 'indiclone51', getProperty('indiclone51.x') - 150, 0.75, 'quadOut')
			doTweenAlpha('indiclone51In', 'indiclone51', 0.9, 0.75, 'quadOut')
		end
		if value1 == '1320' then
			makeAnimatedLuaSprite('indiclone52', 'characters/indigo2', getProperty('indiclone31.x') - 100, getProperty('indiclone31.y') + 25)
			setObjectOrder('indiclone52', getObjectOrder('indiclone51') - 1)
			scaleObject('indiclone52', 0.66, 0.66)
			setProperty('indiclone52.alpha', 0)
			addLuaSprite('indiclone52')
			for i = 1, #anims2 do
				addAnimationByPrefix('indiclone52', anims2[i], 'indigo2 '..anims2[i], 12, false)
			end
			addAnimationByPrefix('indiclone52', 'idle', 'indigo2 idle', 12, true)
			doTweenX('indiclone52move', 'indiclone52', getProperty('indiclone52.x') - 85, 0.75, 'quadOut')
			doTweenAlpha('indiclone52In', 'indiclone52', 0.8, 0.75, 'quadOut')
		end
		if value1 == '1328' then
			makeAnimatedLuaSprite('indiclone53', 'characters/indigo1', getProperty('indiclone31.x') - 400, getProperty('indiclone31.y') + 5)
			setObjectOrder('indiclone53', getObjectOrder('indiclone52') - 1)
			--scaleObject('indiclone53', 0.95, 0.95)
			setProperty('indiclone53.alpha', 0)
			addLuaSprite('indiclone53')
			for i = 1, #anims do
				addAnimationByPrefix('indiclone53', anims[i], 'indigo1 '..anims[i], 12, false)
			end
			doTweenX('indiclone53move', 'indiclone53', getProperty('indiclone53.x') - 100, 0.75, 'quadOut')
			doTweenAlpha('indiclone53In', 'indiclone53', 0.7, 0.75, 'quadOut')
		end
		if value1 == '1336' then
			makeAnimatedLuaSprite('indiclone54', 'characters/indigo2', getProperty('indiclone31.x') - 220, getProperty('indiclone31.y') + 45)
			setObjectOrder('indiclone54', getObjectOrder('indiclone53') - 1)
			scaleObject('indiclone54', 0.6, 0.6)
			setProperty('indiclone54.alpha', 0)
			addLuaSprite('indiclone54')
			for i = 1, #anims2 do
				addAnimationByPrefix('indiclone54', anims2[i], 'indigo2 '..anims2[i], 12, false)
			end
			addAnimationByPrefix('indiclone54', 'idle', 'indigo2 idle', 12, true)
			doTweenX('indiclone54move', 'indiclone54', getProperty('indiclone54.x') - 100, 0.75, 'quadOut')
			doTweenAlpha('indiclone54In', 'indiclone54', 0.6, 0.75, 'quadOut')
		end
		if value1 == '1344' then
			makeAnimatedLuaSprite('indiclone55', 'characters/indigo1', getProperty('indiclone31.x') - 500, getProperty('indiclone31.y') + 35)
			setObjectOrder('indiclone55', getObjectOrder('indiclone54') - 1)
			scaleObject('indiclone55', 0.9, 0.9)
			setProperty('indiclone55.alpha', 0)
			addLuaSprite('indiclone55')
			for i = 1, #anims do
				addAnimationByPrefix('indiclone55', anims[i], 'indigo1 '..anims[i], 12, false)
			end
			doTweenX('indiclone55move', 'indiclone55', getProperty('indiclone55.x') - 100, 0.75, 'quadOut')
			doTweenAlpha('indiclone55In', 'indiclone55', 0.5, 0.75, 'quadOut')
		end
		if value1 == '1376' then
			setCamBase(940, 520)
			makeAnimatedLuaSprite('clock4', 'clock', 760, 20)
			scaleObject('clock4', 0.7, 0.7)
			setProperty('clock4.angle', 30)
			setProperty('clock4.flipX', true)
			setObjectOrder('clock4', getObjectOrder('red') + 1)
			addLuaSprite('clock4')
			addAnimationByPrefix('clock4', 'idle', 'clock idle', 12, true)
			playAnim('clock4', 'idle')
			doTweenY('clock4In', 'clock4', 110, 0.75, 'quadOut')
			scaleNum = 1.15

			for i = 1, 5 do
				if i == 1 then
					makeAnimatedLuaSprite('copyclone6'..i, 'characters/copy', getProperty('indiclone31.x') - 150, 280)
					setObjectOrder('copyclone6'..i, getObjectOrder('indiclone31') - 1)
				else
					makeAnimatedLuaSprite('copyclone6'..i, 'characters/copy', getProperty('copyclone6'..(i-1)..'.x') + 100 + (0*i), 280 + (8*i))
					setObjectOrder('copyclone6'..i, getObjectOrder('copyclone6'..(i-1)) - 1)
				end
				scaleObject('copyclone6'..i, scaleNum, scaleNum)
				setProperty('copyclone6'..i..'.alpha', 1 - (0.1*i))
				addLuaSprite('copyclone6'..i)
				for j = 1, #animsAlt do
					addAnimationByPrefix('copyclone6'..i, animsAlt[j], 'copy '..animsAlt[j], 12, false)
				end
				addAnimationByPrefix('copyclone6'..i, 'idle', 'copy idle', 12, true)
				scaleNum = (scaleNum*0.95)
			end
		end
		if value1 == '1424' then
			setCamBase(730, 480)
		end
		if value1 == '1438' then
			setObjectOrder('black', getObjectOrder('clock3') + 1)
			setProperty('black.alpha', 0)
			setProperty('black.visible', true)
			doTweenAlpha('blackIn', 'black', 1, 2.25, 'linear')
			for i = 1, 5 do
				doTweenAlpha('indiclone5Out'..i, 'indiclone5'..i, 0, 3, 'quadOut')
				doTweenAlpha('copyclone6Out'..i, 'copyclone6'..i, 0, 3, 'quadOut')
			end
		end
		if value1 == '1475' then
			setProperty('indiclone31.x', 525)
			setCamBase(730, 500)
			setObjectOrder('clock', getObjectOrder('black') + 1)
			setProperty('clock.x', getProperty('clock.x') + 200)
			setProperty('clock.y', getProperty('clock.y') + 20)
			makeLuaSprite('gClock', 'grandfatherClock', 470, 310)
			setObjectOrder('gClock', getObjectOrder('indiclone31') - 1)
			addLuaSprite('gClock')
		end
		if value1 == 'decide' then
			if decision == '' then
				thingy = math.random(1, 2)
				if thingy == 1 then
					decision = 'yes'
					doTweenX('pointerMove', 'pointer', 160 + uiOffset, 0.35, 'quadOut')
				else
					decision = 'no'
					doTweenX('pointerMove', 'pointer', 730 + uiOffset, 0.35, 'quadOut')
				end
			end
		end
		if value1 == 'decision' then
			if decision == 'yes' then
				setCamBase(730, 550)
				triggerEvent('Set Cam Zoom', '2.4', '7, quadIn') -- idk why tf it said 67 here before
				doTweenColor('evilGClock', 'gClock', 'FF0000', 7, 'linear')
				doTweenColor('evilIndigo', 'indiclone31', 'FF0000', 7, 'linear')
			elseif decision == 'no' then
				triggerEvent('Set Cam Zoom', '0.5', '7, quadIn') -- same here im so confused
				doTweenAlpha('byeClock', 'clock', 0, 6.5, 'linear')
				doTweenAlpha('byeGClock', 'gClock', 0, 6.5, 'linear')
				doTweenAlpha('evilIndigo', 'indiclone31', 0, 6.5, 'linear')
			end
			doTweenAlpha('scoreTxtOut', 'scoreTxt', 0, 6.5, 'quadIn')
			doTweenAlpha('questiOut', 'question', 0, 0.5, 'linear')
			doTweenAlpha('pointerOut', 'pointer', 0, 0.5, 'linear')
			doTweenY('yesOut', 'yes', 920, 1, 'backIn')
			doTweenY('noOut', 'no', 920, 1, 'backIn')
			runHaxeCode([[ FlxG.mouse.visible = false; ]])
			setProperty('drive.visible', 'false')
		end
		if value1 == 'check' then
			if decision == 'yes' then
				makeLuaSprite('reach', 'reach', getProperty('indiclone31.x') + 58, getProperty('indiclone31.y') + 65)
				scaleObject('reach', 0.8, 0.82)
				setObjectOrder('reach', getObjectOrder('indiclone31') + 1)
				setProperty('reach.color', 0xFF4A4A)
				addLuaSprite('reach', true)
				setProperty('indiclone31.visible', false)
				--doTweenColor('reachCol', 'reach', 'FF0000', 2, 'linear')
			end
		end
		if value1 == 'ending' then
			makeLuaSprite('blackThing', '', -100, -100)
			makeGraphic('blackThing', 1480, 920, '000000')
			setObjectCamera('blackThing', 'other')
			addLuaSprite('blackThing', true)
			makeLuaSprite('tt', 'tick tock', 0 + uiOffset, 0)
			setObjectCamera('tt', 'other')
			addLuaSprite('tt', true)
			doTweenAlpha('ttOut', 'tt', 0, 7, 'quadIn')
		end
	end
end

function onStepHit()
	if curStep == 1 then
		for i = 0, 3 do
			setPropertyFromGroup('opponentStrums', i, 'alpha', 0)
			setPropertyFromGroup('playerStrums', i, 'alpha', 0)
		end
	end
	if curStep == 208 then
		doTweenAlpha('boxOut', 'box', 0, 0.75, 'linear')
		for i = 0, 3 do
			setPropertyFromGroup('opponentStrums', i, 'x', getPropertyFromGroup('opponentStrums', i, 'x') - 800)
			setPropertyFromGroup('opponentStrums', i, 'alpha', 1)
			noteTweenX('moveNotes'..i, i, getPropertyFromGroup('opponentStrums', i, 'x') + 565, 0.75, 'quadOut')
			noteTweenX('moveNotes'..(i+4), (i+4), getPropertyFromGroup('playerStrums', i, 'x') + 235, 0.75, 'quadOut')
		end
	end
	if curStep == 256 then
		doTweenAlpha('boxIn', 'box', 1, 1, 'linear')
		for i = 0, 3 do
			ogOppStrumX = {}
			ogOppStrumX[i] = getPropertyFromGroup('opponentStrums', i, 'x')
    		setPropertyFromGroup('opponentStrums', i, 'x', getPropertyFromGroup('playerStrums', i, 'x'))
    		setPropertyFromGroup('playerStrums', i, 'x', ogOppStrumX[i])
    		noteTweenX('moveNotes'..i, i, getPropertyFromGroup('opponentStrums', i, 'x') + 565, 1, 'quadOut')
    		noteTweenX('moveNotes'..(i+4), (i+4), getPropertyFromGroup('playerStrums', i, 'x') + 235, 1, 'quadOut')
		end
	end
	if curStep == 640 then
		doTweenAlpha('boxOut', 'box', 0, 0.75, 'linear')
		for i = 0, 3 do
			setPropertyFromGroup('opponentStrums', i, 'alpha', 1)
			setPropertyFromGroup('opponentStrums', i, 'x', 262 + (112*i) + 800 + uiOffset)
			setPropertyFromGroup('playerStrums', i, 'x', 262 + (112*i) + uiOffset)
			noteTweenX('moveNotes'..i, i, getPropertyFromGroup('opponentStrums', i, 'x') - 565, 0.75, 'quadOut')
			noteTweenX('moveNotes'..(i+4), (i+4), getPropertyFromGroup('playerStrums', i, 'x') - 235, 0.75, 'quadOut')
		end
	end
	if curStep == 672 then
		doTweenAlpha('boxIn', 'box', 1, 1, 'linear')
		for i = 0, 3 do
			ogOppStrumX = {}
			ogOppStrumX[i] = getPropertyFromGroup('opponentStrums', i, 'x')
    		setPropertyFromGroup('opponentStrums', i, 'x', getPropertyFromGroup('playerStrums', i, 'x'))
    		setPropertyFromGroup('playerStrums', i, 'x', ogOppStrumX[i])
    		noteTweenX('moveNotes'..i, i, getPropertyFromGroup('opponentStrums', i, 'x') - 565, 1, 'quadOut')
    		noteTweenX('moveNotes'..(i+4), (i+4), getPropertyFromGroup('playerStrums', i, 'x') - 235, 1, 'quadOut')
		end
	end
	if curStep == 748 then
		doTweenAlpha('boxOut', 'box', 0, 0.25, 'linear')
		for i = 0, 3 do
			setPropertyFromGroup('opponentStrums', i, 'x', 262 + (112*i) - 800 + uiOffset)
			setPropertyFromGroup('playerStrums', i, 'x', 262 + (112*i) + uiOffset)
			setPropertyFromGroup('opponentStrums', i, 'alpha', 1)
			noteTweenX('moveNotes'..i, i, getPropertyFromGroup('opponentStrums', i, 'x') + 565, 0.75, 'quadOut')
			noteTweenX('moveNotes'..(i+4), (i+4), getPropertyFromGroup('playerStrums', i, 'x') + 235, 0.75, 'quadOut')
		end
	end
	if curStep == 768 then
		for i = 0, 3 do
			ogOppStrumX = {}
			ogOppStrumX[i] = getPropertyFromGroup('opponentStrums', i, 'x')
    		setPropertyFromGroup('opponentStrums', i, 'x', getPropertyFromGroup('playerStrums', i, 'x'))
    		setPropertyFromGroup('playerStrums', i, 'x', ogOppStrumX[i])
    		noteTweenX('moveNotes'..i, i, getPropertyFromGroup('opponentStrums', i, 'x') - 235, 0.75, 'quadOut')
    		noteTweenX('moveNotes'..(i+4), (i+4), getPropertyFromGroup('playerStrums', i, 'x') + 235, 0.75, 'quadOut')
			noteTweenAlpha('noteAlpha'..i, i, 0, 0.75, 'linear')
		end
	end
	if curStep == 896 then
		for i = 0, 3 do
			setPropertyFromGroup('opponentStrums', i, 'x', 262 + (112*i) + uiOffset)
			setPropertyFromGroup('playerStrums', i, 'x', 262 + (112*i) + uiOffset)
			setPropertyFromGroup('opponentStrums', i, 'alpha', 1)
			noteTweenX('moveNotes'..i, i, getPropertyFromGroup('opponentStrums', i, 'x') + 235, 0.75, 'quadOut')
			noteTweenX('moveNotes'..(i+4), (i+4), getPropertyFromGroup('playerStrums', i, 'x') - 235, 0.75, 'quadOut')
		end
	end
	if curStep == 928 then
		doTweenAlpha('boxIn', 'box', 1, 1, 'linear')
		for i = 0, 3 do
			ogOppStrumX = {}
			ogOppStrumX[i] = getPropertyFromGroup('opponentStrums', i, 'x')
    		setPropertyFromGroup('opponentStrums', i, 'x', getPropertyFromGroup('playerStrums', i, 'x'))
    		setPropertyFromGroup('playerStrums', i, 'x', ogOppStrumX[i])
    		noteTweenX('moveNotes'..i, i, getPropertyFromGroup('opponentStrums', i, 'x') - 565, 0.75, 'quadOut')
    		noteTweenX('moveNotes'..(i+4), (i+4), getPropertyFromGroup('playerStrums', i, 'x') - 235, 0.75, 'quadOut')
			noteTweenAlpha('noteAlpha'..i, i, 0, 0.75, 'linear')
		end
	end
	if curStep == 1184 then
		if not downscroll then
			noteTweenY('loopNoteUp4', 4, 35, 0.5, 'quadInOut')
			noteTweenY('loopNoteUp0', 0, 35, 0.5, 'quadInOut')
		else --downscroll
			noteTweenY('loopNoteUp4', 4, 555, 0.5, 'quadInOut')
			noteTweenY('loopNoteUp0', 0, 555, 0.5, 'quadInOut')
		end
	end
	if curStep == 1186 then
		if not downscroll then
			noteTweenY('loopNoteUp5', 5, 35, 0.5, 'quadInOut')
			noteTweenY('loopNoteUp1', 1, 35, 0.5, 'quadInOut')
		else
			noteTweenY('loopNoteUp5', 5, 555, 0.5, 'quadInOut')
			noteTweenY('loopNoteUp1', 1, 555, 0.5, 'quadInOut')
		end
	end
	if curStep == 1188 then
		if not downscroll then
			noteTweenY('loopNoteUp6', 6, 35, 0.5, 'quadInOut')
			noteTweenY('loopNoteUp2', 2, 35, 0.5, 'quadInOut')
		else
			noteTweenY('loopNoteUp6', 6, 555, 0.5, 'quadInOut')
			noteTweenY('loopNoteUp2', 2, 555, 0.5, 'quadInOut')
		end
	end
	if curStep == 1190 then
		if not downscroll then
			noteTweenY('loopNoteUp7', 7, 35, 0.5, 'quadInOut')
			noteTweenY('loopNoteUp3', 3, 35, 0.5, 'quadInOut')
		else
			noteTweenY('loopNoteUp7', 7, 555, 0.5, 'quadInOut')
			noteTweenY('loopNoteUp3', 3, 555, 0.5, 'quadInOut')
		end
	end
	if curStep == 1310 then
		for i = 0, 3 do
			setPropertyFromGroup('playerStrums', i, 'x', 262 + (112*i) + uiOffset)
			noteTweenX('moveNotes'..(i+4), (i+4), getPropertyFromGroup('playerStrums', i, 'x') + 235, 0.75, 'quadOut')
		end
	end
	if curStep == 1376 then
		for i = 0, 3 do
			setPropertyFromGroup('playerStrums', i, 'x', 262 + (112*i) + 235 + uiOffset)
			noteTweenX('moveNotes'..(i+4), (i+4), getPropertyFromGroup('playerStrums', i, 'x') - 470, 0.75, 'quadOut')
		end
	end
	if curStep == 1424 then
		for i = 0, 3 do
			setPropertyFromGroup('playerStrums', i, 'x', 262 + (112*i) - 235 + uiOffset)
			noteTweenX('moveNotes'..(i+4), (i+4), getPropertyFromGroup('playerStrums', i, 'x') + 235, 0.75, 'quadOut')
		end
	end
	if curStep == 1536 then
		for i = 0, 3 do
			setPropertyFromGroup('opponentStrums', i, 'x', 262 + (112*i) + uiOffset)
			setPropertyFromGroup('opponentStrums', i, 'alpha', 1)
		end
	end
	if curStep == 1547 then
		for i = 0, 3 do
			setPropertyFromGroup('playerStrums', i, 'alpha', 0)
			noteTweenAlpha('fadeNotes'..i, i, 0, 0.75, 'linear')
		end
		curPlayer = ''
		clonesO = {'indiclone31'}
		runHaxeCode([[ FlxG.mouse.visible = true; ]])
		doTweenY('questIn', 'question', 29, 1, 'quadOut')
		doTweenY('yesIn', 'yes', 520, 1, 'quadOut')
		doTweenY('noIn', 'no', 520, 1, 'quadOut')
		doTweenAlpha('fingIn', 'pointer', 1, 1, 'quadOut')
	end
end

function onTweenCompleted(tag)
	for i = 0, 7 do
		if not downscroll then
			if tag == 'loopNoteUp'..i then
				noteTweenY('loopNoteDown'..i, i, 65, 1, 'quadInOut')
			end
			if tag == 'loopNoteDown'..i then
				noteTweenY('loopNoteUp'..i, i, 35, 1, 'quadInOut')
			end
		else
			if tag == 'loopNoteUp'..i then
				noteTweenY('loopNoteDown'..i, i, 595, 1, 'quadInOut')
			end
			if tag == 'loopNoteDown'..i then
				noteTweenY('loopNoteUp'..i, i, 555, 1, 'quadInOut')
			end
		end
	end
end

function goodNoteHit(index, noteDir, noteType, isSustainNote)
	setTextString('hpNum1', string.sub(pad3(tostring(getProperty('healthBar.percent') * 2)), 1, 1))
	setTextString('hpNum2', string.sub(pad3(tostring(getProperty('healthBar.percent') * 2)), 2, 2))
	setTextString('hpNum3', string.sub(pad3(tostring(getProperty('healthBar.percent') * 2)), 3, 3))
	setTextString('scoreTxt', 'SCORE: '..tostring(getProperty('songScore')))
	if moveDaTarget then
		moveTarget(noteDir)
	end
	if not (noteType == 'No Animation') then
		if noteType == 'Alt Animation' then
			if noteDir == 0 then
				playAnim(curPlayer, 'alt-left', true)
				for i = 1, #clonesP do
					playAnim(clonesP[i], 'alt-left', true)
				end
			elseif noteDir == 1 then
				playAnim(curPlayer, 'alt-down', true)
				for i = 1, #clonesP do
					playAnim(clonesP[i], 'alt-down', true)
				end
			elseif noteDir == 2 then
				playAnim(curPlayer, 'alt-up', true)
				for i = 1, #clonesP do
					playAnim(clonesP[i], 'alt-up', true)
				end
			elseif noteDir == 3 then
				playAnim(curPlayer, 'alt-right', true)
				for i = 1, #clonesP do
					playAnim(clonesP[i], 'alt-right', true)
				end
			end
		else
			if noteDir == 0 then
				playAnim(curPlayer, 'left', true)
				for i = 1, #clonesP do
					playAnim(clonesP[i], 'left', true)
				end
			elseif noteDir == 1 then
				playAnim(curPlayer, 'down', true)
				for i = 1, #clonesP do
					playAnim(clonesP[i], 'down', true)
				end
			elseif noteDir == 2 then
				playAnim(curPlayer, 'up', true)
				for i = 1, #clonesP do
					playAnim(clonesP[i], 'up', true)
				end
			elseif noteDir == 3 then
				playAnim(curPlayer, 'right', true)
				for i = 1, #clonesP do
					playAnim(clonesP[i], 'right', true)
				end
			end
		end
	end
	runTimer('backToIdleP', 0.7)
end

function opponentNoteHit(id, noteDir, noteType, isSustain)
	if not (noteType == 'No Animation') then
		if noteType == 'Alt Animation' then
			if noteDir == 0 then
				for i = 1, #clonesO do
					playAnim(clonesO[i], 'alt-left', true)
				end
			elseif noteDir == 1 then
				for i = 1, #clonesO do
					playAnim(clonesO[i], 'alt-down', true)
				end
			elseif noteDir == 2 then
				for i = 1, #clonesO do
					playAnim(clonesO[i], 'alt-up', true)
				end
			elseif noteDir == 3 then
				for i = 1, #clonesO do
					playAnim(clonesO[i], 'alt-right', true)
				end
			end
		else
			if noteDir == 0 then
				for i = 1, #clonesO do
					playAnim(clonesO[i], 'left', true)
				end
				for i = 1, #clonesO2 do
					playAnim(clonesO2[i], 'alt-left', true)
				end
			elseif noteDir == 1 then
				for i = 1, #clonesO do
					playAnim(clonesO[i], 'down', true)
				end
				for i = 1, #clonesO2 do
					playAnim(clonesO2[i], 'alt-down', true)
				end
			elseif noteDir == 2 then
				for i = 1, #clonesO do
					playAnim(clonesO[i], 'up', true)
				end
				for i = 1, #clonesO2 do
					playAnim(clonesO2[i], 'alt-up', true)
				end
			elseif noteDir == 3 then
				for i = 1, #clonesO do
					playAnim(clonesO[i], 'right', true)
				end
				for i = 1, #clonesO2 do
					playAnim(clonesO2[i], 'alt-right', true)
				end
			end
		end
		runTimer('backToIdleO', 0.7)
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'backToIdleO' then
		for i = 1, #clonesO do
			playAnim(clonesO[i], 'idle')
		end
	end
	if tag == 'backToIdleP' then
		playAnim(curPlayer, 'idle')
		for i = 1, #clonesP do
			playAnim(clonesP[i], 'idle')
		end
	end
	if tag == 'camBack' then
      	triggerEvent('Camera Follow Pos', baseX, baseY)
    end
end

function moveTarget(noteDir)
    if noteDir == 0 then
		triggerEvent('Camera Follow Pos', baseX - offset, baseY)
    elseif noteDir == 1 then
        triggerEvent('Camera Follow Pos', baseX, baseY + offset)
    elseif noteDir == 2 then
        triggerEvent('Camera Follow Pos', baseX, baseY - offset)
    elseif noteDir == 3 then
        triggerEvent('Camera Follow Pos', baseX + offset, baseY)
    end
    runTimer('camBack', 0.7)
end

function setCamBase(x, y)
	baseX = x
	baseY = y
	triggerEvent('Camera Follow Pos', x, y)
end

function noteShit()
	for i = 0, getProperty('unspawnNotes.length') - 1 do
			local mustPress1 = getPropertyFromGroup('notes', i, 'mustPress')
			if mustPress1 then
				if pD == '1' then
					setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteSkins/NOTE_assets')
					setPropertyFromGroup('unspawnNotes', i, 'noteSplashData.texture', 'noteSplashes/noteSplashes')
            	elseif pD == '2' then
					setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteSkins/EVILNOTE_assets')
					setPropertyFromGroup('unspawnNotes', i, 'noteSplashData.texture', 'noteSplashes/EVILnoteSplashes')
				elseif pD == '3' then
					setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteSkins/EVILNOTE_assets2')
					setPropertyFromGroup('unspawnNotes', i, 'noteSplashData.texture', 'noteSplashes/EVILnoteSplashes')
				elseif pD == '4' then
					setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteSkins/blackNOTE_assets')
					setPropertyFromGroup('unspawnNotes', i, 'noteSplashData.texture', 'noteSplashes/blacknoteSplashes')
				elseif pD == '5' then
					setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteSkins/switchNOTE_assets')
					setPropertyFromGroup('unspawnNotes', i, 'noteSplashData.texture', 'noteSplashes/noteSplashes')
				elseif pD == '67' then
					setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteSkins/switchEVILNOTE_assets')
					setPropertyFromGroup('unspawnNotes', i, 'noteSplashData.texture', 'noteSplashes/EVILnoteSplashes')
				end
			else
				if oD == '1' then
					setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteSkins/NOTE_assets')
				elseif oD == '2' then
					setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteSkins/EVILNOTE_assets')
				elseif oD == '3' then
					setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteSkins/EVILNOTE_assets2')
				elseif oD == '4' then
					setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteSkins/blackNOTE_assets')
				elseif oD == '5' then
					setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteSkins/switchNOTE_assets')
				elseif oD == '67' then
					setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteSkins/switchEVILNOTE_assets')
				end
			end
		end
		for i = 0, getProperty('notes.length')-1 do
			local mustPress2 = getPropertyFromGroup('notes', i, 'mustPress')
            if mustPress2 then
                if pD == '1' then
                    setPropertyFromGroup('notes', i, 'texture', 'noteSkins/NOTE_assets')
					setPropertyFromGroup('notes', i, 'noteSplashData.texture', 'noteSplashes/noteSplashes')
                elseif pD == '2' then
                    setPropertyFromGroup('notes', i, 'texture', 'noteSkins/EVILNOTE_assets')
					setPropertyFromGroup('notes', i, 'noteSplashData.texture', 'noteSplashes/EVILnoteSplashes')
				elseif pD == '3' then
                    setPropertyFromGroup('notes', i, 'texture', 'noteSkins/EVILNOTE_assets2')
					setPropertyFromGroup('notes', i, 'noteSplashData.texture', 'noteSplashes/EVILnoteSplashes')
				elseif pD == '4' then
                    setPropertyFromGroup('notes', i, 'texture', 'noteSkins/blackNOTE_assets')
					setPropertyFromGroup('notes', i, 'noteSplashData.texture', 'noteSplashes/blacknoteSplashes')
					elseif pD == '5' then
					setPropertyFromGroup('notes', i, 'texture', 'noteSkins/switchNOTE_assets')
					setPropertyFromGroup('notes', i, 'noteSplashData.texture', 'noteSplashes/noteSplashes')
				elseif pD == '67' then
					setPropertyFromGroup('notes', i, 'texture', 'noteSkins/switchEVILNOTE_assets')
					setPropertyFromGroup('notes', i, 'noteSplashData.texture', 'noteSplashes/EVILnoteSplashes')
                end
            else
                if oD == '1' then
                    setPropertyFromGroup('notes', i, 'texture', 'noteSkins/NOTE_assets')
                elseif oD =='2' then
                    setPropertyFromGroup('notes', i, 'texture', 'noteSkins/EVILNOTE_assets')
				elseif oD =='3' then
                    setPropertyFromGroup('notes', i, 'texture', 'noteSkins/EVILNOTE_assets2')
				elseif oD =='4' then
                    setPropertyFromGroup('notes', i, 'texture', 'noteSkins/blackNOTE_assets')
				elseif oD == '5' then
					setPropertyFromGroup('notes', i, 'texture', 'noteSkins/switchNOTE_assets')
				elseif oD == '67' then
					setPropertyFromGroup('notes', i, 'texture', 'noteSkins/switchEVILNOTE_assets')
                end
            end
        end
		for i = 0, 3 do
			if pD == '1' then
				setPropertyFromGroup('playerStrums', i, 'texture', 'noteSkins/NOTE_assets')
			elseif pD == '2' then
				setPropertyFromGroup('playerStrums', i, 'texture', 'noteSkins/EVILNOTE_assets')
			elseif pD == '3' then
				setPropertyFromGroup('playerStrums', i, 'texture', 'noteSkins/EVILNOTE_assets2')
			elseif pD == '3' then
				setPropertyFromGroup('playerStrums', i, 'texture', 'noteSkins/blackNOTE_assets')
			elseif pD == '5' then
				setPropertyFromGroup('playerStrums', i, 'texture', 'noteSkins/switchNOTE_assets')
			elseif pD == '67' then
				setPropertyFromGroup('playerStrums', i, 'texture', 'noteSkins/switchEVILNOTE_assets')
			end
			if oD == '1' then
				setPropertyFromGroup('opponentStrums', i, 'texture', 'noteSkins/NOTE_assets')
			elseif oD == '2' then
				setPropertyFromGroup('opponentStrums', i, 'texture', 'noteSkins/EVILNOTE_assets')
			elseif oD == '3' then
				setPropertyFromGroup('opponentStrums', i, 'texture', 'noteSkins/EVILNOTE_assets2')
			elseif oD == '3' then
				setPropertyFromGroup('opponentStrums', i, 'texture', 'noteSkins/blackNOTE_assets')
			elseif oD == '5' then
				setPropertyFromGroup('opponentStrums', i, 'texture', 'noteSkins/switchNOTE_assets')
			elseif oD == '67' then
				setPropertyFromGroup('opponentStrums', i, 'texture', 'noteSkins/switchEVILNOTE_assets')
			end
		end
end

function pad3(str)
    if #str == 1 then
        return "00" .. str
    elseif #str == 2 then
        return "0" .. str
    else
        return str
    end
end

function noteMiss(index, noteDir, noteType, isSustainNote)
	setTextString('hpNum1', string.sub(pad3(tostring(getProperty('healthBar.percent') * 2)), 1, 1))
	setTextString('hpNum2', string.sub(pad3(tostring(getProperty('healthBar.percent') * 2)), 2, 2))
	setTextString('hpNum3', string.sub(pad3(tostring(getProperty('healthBar.percent') * 2)), 3, 3))
	setTextString('scoreTxt', 'SCORE: '..tostring(getProperty('songScore')))
end

function mouseOverlaps(obj, camera)
    local mX = getMouseX(camera or 'camHUD') + getProperty(camera .. '.scroll.x')
    local mY = getMouseY(camera or 'camHUD') + getProperty(camera .. '.scroll.y')
    local x = getProperty(obj .. '.x')
    local y = getProperty(obj .. '.y')
    local width = getProperty(obj .. '.width')
    local height = getProperty(obj .. '.height')
    return (mX > x) and (mX < x + width) and (mY > y) and (mY < y + height)
end