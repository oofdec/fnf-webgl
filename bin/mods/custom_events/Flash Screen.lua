flashers = 0

function onEvent(eventName, value1, value2)
    if eventName == 'Flash Screen' then
        flashers = flashers + 1
        makeLuaSprite('screenFlash'..flashers, '', 0, 0)
        makeGraphic('screenFlash'..flashers, 2000, 2000, value1)
        setObjectCamera('screenFlash'..flashers, 'camHUD')
        setObjectOrder('screenFlash'..flashers, 12)
        addLuaSprite('screenFlash'..flashers, true)
        doTweenAlpha('screenFlashOut'..flashers, 'screenFlash'..flashers, 0, 1, 'linear')
    end
end