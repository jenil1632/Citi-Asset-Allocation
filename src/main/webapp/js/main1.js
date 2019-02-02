// js obfuscated

jQuery(document)['ready'](function(_0xde6bx1) {
    'use strict';
    var _0xde6bx2 = _0xde6bx1('.cd-overlay-nav'),
        _0xde6bx3 = _0xde6bx1('.cd-overlay-content'),
        _0xde6bx4 = _0xde6bx1('.cd-primary-nav'),
        _0xde6bx5 = _0xde6bx1('.cd-nav-trigger');
    _0xde6bx6();
    _0xde6bx1(window)['on']('resize', function() {
        window['requestAnimationFrame'](_0xde6bx6)
    });
    _0xde6bx5['on']('click', function() {
        if (!_0xde6bx5['hasClass']('close-nav')) {
            _0xde6bx5['addClass']('close-nav');
            _0xde6bx2['children']('span')['velocity']({
                translateZ: 0,
                scaleX: 1,
                scaleY: 1
            }, 500, 'easeInCubic', function() {
                _0xde6bx4['addClass']('fade-in')
            })
        } else {
            _0xde6bx5['removeClass']('close-nav');
            _0xde6bx3['children']('span')['velocity']({
                translateZ: 0,
                scaleX: 1,
                scaleY: 1
            }, 500, 'easeInCubic', function() {
                _0xde6bx4['removeClass']('fade-in');
                _0xde6bx2['children']('span')['velocity']({
                    translateZ: 0,
                    scaleX: 0,
                    scaleY: 0
                }, 0);
                _0xde6bx3['addClass']('is-hidden')['one']('webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd transitionend', function() {
                    _0xde6bx3['children']('span')['velocity']({
                        translateZ: 0,
                        scaleX: 0,
                        scaleY: 0
                    }, 0, function() {
                        _0xde6bx3['removeClass']('is-hidden')
                    })
                });
                if (_0xde6bx1('html')['hasClass']('no-csstransitions')) {
                    _0xde6bx3['children']('span')['velocity']({
                        translateZ: 0,
                        scaleX: 0,
                        scaleY: 0
                    }, 0, function() {
                        _0xde6bx3['removeClass']('is-hidden')
                    })
                }
            })
        }
    });

    function _0xde6bx6() {
        var _0xde6bx7 = (Math['sqrt'](Math['pow'](_0xde6bx1(window)['height'](), 2) + Math['pow'](_0xde6bx1(window)['width'](), 2)) * 2);
        _0xde6bx2['children']('span')['velocity']({
            scaleX: 0,
            scaleY: 0,
            translateZ: 0
        }, 50)['velocity']({
            height: _0xde6bx7 + 'px',
            width: _0xde6bx7 + 'px',
            top: -(_0xde6bx7 / 2) + 'px',
            left: -(_0xde6bx7 / 2) + 'px'
        }, 0);
        _0xde6bx3['children']('span')['velocity']({
            scaleX: 0,
            scaleY: 0,
            translateZ: 0
        }, 50)['velocity']({
            height: _0xde6bx7 + 'px',
            width: _0xde6bx7 + 'px',
            top: -(_0xde6bx7 / 2) + 'px',
            left: -(_0xde6bx7 / 2) + 'px'
        }, 0)
    }
})
