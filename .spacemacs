;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(markdown
     ;; (javascript :variables
     ;;             javascript-backend 'lsp)
     (javascript :variables
                 javascript-backend 'tern
                 )
     ;; lsp
     autohotkey
     html
     python
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     theming
     helm
     multiple-cursors
     evil-snipe
     themes-megapack
     (auto-completion :variables
                      auto-completion-enable-sort-by-usage t
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-return-key-behavior 'complete
                      auto-completion-tab-key-behavior 'complete
                      auto-completion-enable-help-tooltip t
                      auto-completion-complete-with-key-sequence "ks"
                      )
     ;; better-defaults
     emacs-lisp
     (git :variables
          git-magit-status-fullscreen t)
     org
     ranger
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     ;; spell-checking
     syntax-checking
     ;; Has smerge mode in it
     (version-control :variables
                      version-control-global-margin t
                      version-control-diff-tool 'git-gutter+
                      version-control-diff-side 'left
                      )
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(smooth-scroll evil-smartparens
                                                    centaur-tabs atom-one-dark-theme
                                                    evil-goggles swiper ivy wgrep
                                                    )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style '(vim :variables
                                    vim-style-visual-line-move-text nil
                                    vim-style-ex-substitute-global nil)
   ;; Self inserted, required by Spacemacs otherwise kept throwing error.
   dotspacemacs-mode-line-theme 'spacemacs
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state nil
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("consolas"
                               :size 24
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ t
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts t
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'original
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup t
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers '(:relative t
                              :disabled-for-modes dired-mode
                                                  ranger-mode
                               )
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'nil
   ;; Enable daemon server
   ;; dotspacemacs-enable-server t
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  ;; Install atom one dark theme and set as default
  ;; (add-to-list 'custom-theme-load-path "~/.emacs.d/private/themes/atom-one-dark-theme/")

  ;; Custom theme settings, through the "theming" layer
  (setq theming-modifications
        ;; Monochrome-bright, the default light theme
        '((solarized-dark
           ;; Git gutter colors, make background visible
           (git-gutter-fr:added :weight bold
                                :foreground "black"
                                :background "#859900")
           (git-gutter-fr:deleted :weight bold
                                  :foreground "black"
                                  :background "#dc322f")
           (git-gutter-fr:modified :weight bold
                                   :foreground "black"
                                   :background "#268bd2")
           (git-gutter-fr+-added :weight bold
                                :foreground "black"
                                :background "#859900")
           (git-gutter-fr+-deleted :weight bold
                                :foreground "black"
                                :background "#dc322f")
           (git-gutter-fr+-modified :weight bold
                                :foreground "black"
                                :background "#268bd2")
           )
          (monochrome-bright
           ;; Font locking
           (font-lock-builtin-face :foreground "black"
                                   :slant italic)
           (font-lock-constant-face :foreground "black"
                                    :slant italic
                                    :weight normal)
           (font-lock-function-name-face :foreground "black"
                                         :slant italic
                                         :weight bold)
           (font-lock-keyword-face :foreground "black"
                                   :weight bold)
           (font-lock-string-face :foreground "gray50"
                                  :weight bold
                                  :slant italic)
           (font-lock-variable-name-face :foreground "black"
                                         :weight normal)
           (font-lock-warning-face :foreground "gray65"
                                   :underline t)
           (evil-snipe-first-match-face  :background "gray40"
                                         :foreground "black")
           (evil-snipe-matches-face  :background "gray50"
                                     :foreground "white")
           (evil-ex-search  :background "gray40"
                            :foreground "white")
           (evil-ex-lazy-highlight  :background "gray60"
                                    :foreground "black")
           (highlight :background "gray80"
                      :foreground "black")
           (js2-external-variable :foreground "gray40"
                                  :underline t)
           (js2-function-param :foreground "gray40"
                               :weight bold)
           (js2-private-function-call :foreground "gray40")
           (web-mode-html-attr-name-face :foreground "black"
                                         :weight bold)
           (font-lock-comment-face :slant italic
                                   :foreground "gray30"
                          :family "courier new"
                          :height 0.93)
           (cursor :foreground "gray20")
           (helm-selection :background "gray80")
           (evil-mc-cursor-default-face :foreground "white"
                                        :background "gray40")
           (evil-ex-substitute-matches :background "gray50")
           (sp-show-pair-match-face :background "gray50")
           (avy-lead-face :background "gray75"
                          :foreground "black")
           (avy-lead-face-0 :background "gray85"
                            :foreground "black")
           (avy-lead-face-2 :background "gray95"
                            :foreground "black")
           (web-mode-folded-face :underline (:color "black" :style line)
                                 :background "gray85")
           ;; Used by Magit popup window to show the optional argument
           ;; faces, old magit-popup-argument is deprecated
           (transient-argument :foreground "black"
                               :underline (:color "black" :style line))
           (transient-inactive-argument :foreground "gray65")
           (web-mode-doctype-face :foreground "black"
                                  :weight bold)
           ;; (web-mode-html-tag-face :foreground "black"
           ;;                         :weight bold
           ;;                         :slant italic)
           (web-mode-html-tag-face :foreground "black"
                                   :weight bold
                                   )
           (web-mode-html-attr-name-face :slant italic
                                         :weight bold)
           (web-mode-current-element-highlight-face :foreground "white"
                                                    :background "gray50")
           (centaur-tabs-selected :foreground "white"
                                  :background "black"
                                  :weight bold
                                  :slant normal)
           (centaur-tabs-selected-modified :foreground "white"
                                           :background "black"
                                           :weight bold
                                           :slant italic)
           (centaur-tabs-unselected :foreground "white"
                                    :background "gray50"
                                    :weight normal
                                    :slant normal)
           (centaur-tabs-unselected-modified :foreground "white"
                                             :background "gray50"
                                             :weight normal
                                             :slant italic)
           (web-mode-current-column-highlight-face :background "gray75")
           (lsp-ui-sideline-code-action :slant italic
                                        :background "white"
                                        :foreground "gray45")
           (lsp-ui-sideline-symbol :slant italic
                                   :foreground "gray45"
                                   :box (:line-width 1 :color "gray45" :style released-button))
           (lsp-ui-sideline-current-symbol :slant italic
                                           :foreground "gray45")
           (iedit-occurrence :background "gray50"
                             :foreground "white")
           (magit-section-highlight :background "gray80")
           (magit-diff-added :foreground "black")
           (magit-diff-added-highlight :background "gray85"
                                       :foreground "black")
           (magit-diff-removed :weight bold
                               :slant italic
                               :foreground "gray45")
           (magit-diff-removed-highlight :background "gray90"
                                         :weight bold
                                         :slant italic
                                         :foreground "gray45")
           (magit-branch-current :weight bold
                                 :foreground "black"
                                 :background "gray75"
                                 :box (:line-width 2 :color "black" :style released-button))
           (magit-branch-local :slant italic
                               :foreground "black"
                               :box (:line-width 1 :color "black" :style released-button))
           (magit-branch-remote-head :slant italic
                                     :foreground "black"
                                     :weight bold
                                     :box (:line-width 1 :color "black" :style released-button))
           )))
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  ;; (setq tern-command '("node" "C:/Users/nkgfr/AppData/Roaming/npm/node_modules/tern/bin/tern"))
  ;; Settings for es (Everything search tool's CLI) integration for helm-locate
  ;; Specifically implement sorting by run-count
  ;; (setq helm-locate-command "es.exe %s -sort run-count %s")
  (setq company-lsp-cache-candidates t)
  ;; (setq helm-locate-command "es.exe %s %s")
  ;; (defun helm-es-hook ()
  ;;   (when (and (equal (assoc-default 'name (helm-get-current-source)) "Locate")
  ;;              (string-match "\\`es" helm-locate-command))
  ;;     (mapc (lambda (file)
  ;;             (call-process "es" nil nil nil
  ;;                           "-inc-run-count" (convert-standard-filename file)))
  ;;           (helm-marked-candidates))))
  ;; (add-hook 'helm-find-many-files-after-hook 'helm-es-hook)

  ;; Implement live skewer reloading for js, css, and html files.
  ;; (add-hook 'js2-mode-hook 'skewer-mode)
  ;; (add-hook 'css-mode-hook 'skewer-css-mode)
  ;; (add-hook 'web-mode-hook 'skewer-html-mode)

  ;; Run helm clear cache before every swoop session,
  ;; for some reason the cache is not always updated.
  ;; Below doesn't actually seem to work so had to define another
  ;; custom function below.
  (defun auto-helm-swoop-clear-cache ()
    (if (eq this-command 'helm-swoop)
        (spacemacs/helm-swoop-clear-cache)))

  ;; Custom function that clears cache before helm swoop
  (defun helm-swoop-with-clear-cache ()
    (interactive)
    (spacemacs/helm-swoop-clear-cache)
    (helm-swoop)
    )

  (spacemacs/set-leader-keys "ss" 'helm-swoop-with-clear-cache)

  ;; Web mode bindings
  (spacemacs/set-leader-keys-for-major-mode 'web-mode "c" 'web-mode-element-children-fold-or-unfold)

  ;; Ignore node_modules from projectile indexing
  (add-to-list 'projectile-globally-ignored-directories "node_modules")
  ;; This doesn't seem to work, instead listing it in the .projectile file works
  ;; (add-to-list 'projectile-globally-ignored-directories "/**/node_modules")

  ;; Implement Ediff function to implement changes from both buffers A and B into C.
  (defun ediff-copy-both-to-C ()
    (interactive)
    (ediff-copy-diff ediff-current-difference nil 'C nil
                     (concat
                      (ediff-get-region-contents ediff-current-difference 'A ediff-control-buffer)
                      (ediff-get-region-contents ediff-current-difference 'B ediff-control-buffer))))
  (defun add-d-to-ediff-mode-map () (define-key ediff-mode-map "B" 'ediff-copy-both-to-C))
  (add-hook 'ediff-keymap-setup-hook 'add-d-to-ediff-mode-map)

  ;; Needed to suppress the unsafe .emacs.d/server directory error
  ;; which is a problem both in running a daemon and in Magit (throws
  ;; error when trying to commit)
  ;; Haven't figured out how to run emacs daemon yet.
  (defadvice server-ensure-safe-dir (around
                                     my-around-server-ensure-safe-dir
                                     activate)
    "Ignores any errors raised from server-ensure-safe-dir"
    (ignore-errors ad-do-it))
  ;; (server-start)

  ;; Set autosave to run after 1s of idle time
  ;; (setq auto-save-timeout 1)

  ;; Set proper indentation for web mode
  (setq-default indent-tabs-mode nil)
  (defun my-web-mode-hook ()
    "Hooks for Web mode."
    (setq web-mode-markup-indent-offset 2)
    (setq web-mode-css-indent-offset 2)
    (setq web-mode-code-indent-offset 2)
    (setq web-mode-enable-auto-pairing t)
    (setq web-mode-enable-auto-closing t)
    (setq web-mode-enable-current-element-highlight t)
    (setq web-mode-enable-current-column-highlight t)
    )
  (add-hook 'web-mode-hook  'my-web-mode-hook)


  ;; Needed to enable proper evil smartparens, cannot use yet as incompatible
  ;; with evil-goggles. For now has to be enabled manually.
  ;; (add-hook 'smartparens-enabled-hook #'evil-smartparens-mode)

  ;; Rebind scrolling up from C-u as that doesn't work in many
  ;; transient states
  (global-set-key (kbd "C-c C-1 C-u") 'evil-scroll-up)

  ;; Enable automatic indentation of content in org mode
  (add-hook 'org-mode-hook 'org-indent-mode)

  ;; Apply evil-snipe features to 't' and 'f' motions
  ;; such as multiline selection, ';' and ',' bindings, etc
  (evil-snipe-override-mode 1)

  ;; Binding for append to register to mimic vim appending to capital registers
  (define-key evil-normal-state-map (kbd "_") 'append-to-register)
  (define-key evil-motion-state-map (kbd "_") nil)

  ;; Add visual mode bindings for evil-snipe
  (evil-define-key 'visual evil-snipe-local-mode-map "z" 'evil-snipe-s)
  (evil-define-key 'visual evil-snipe-local-mode-map "Z" 'evil-snipe-S)

  ;; Prevent evil-snipe-override-mode from interfering with Magit buffers
  (add-hook 'magit-mode-hook 'turn-off-evil-snipe-override-mode)

  ;; Set shell run with M-x shell command
  ;; (setq-default explicit-shell-file-name "C:/Windows/System32/bash.exe")

  ;; Needed to run M-x shell-command (also used in ranger ! command)
  ;; (setq-default shell-file-name "C:/Windows/System32/bash.exe")

  ;; Binding to run shell
  (global-set-key (kbd "C-c C-M-s") 'shell)

  ;; Enable centaur-tabs and tab grouping by projectile project
  (centaur-tabs-mode t)
  (centaur-tabs-group-by-projectile-project)

  ;; Settings for centaur-tabs
  (setq centaur-tabs-set-close-button nil)  ;; Disable close button
  (setq centaur-tabs-set-modified-marker t) ;; Show marker when buffer has been modified
  (setq centaur-tabs-set-bar 'left)         ;; Show active tab indicator on top
  (setq centaur-tabs-cycle-scope 'tabs)     ;; Don't cycle to new group when going past first or last tab
  (setq centaur-tabs-modified-marker "*")

  ;; Bindings for centaur-tabs, hotkeyed in AHK
  (global-set-key (kbd "C-M-]") 'centaur-tabs-forward-tab)
  (global-set-key (kbd "C-M-[") 'centaur-tabs-backward-tab)
  (global-set-key (kbd "C-c C-M-<left>") 'centaur-tabs-move-current-tab-to-left)
  (global-set-key (kbd "C-c C-M-<right>") 'centaur-tabs-move-current-tab-to-right)

  ;; Set custom avy keys
  (setq avy-keys '(?a ?s ?f ?j ?l ?w ?r ?k ?x ?u ?o
                      ?i ?e ?c ?v ?n ?m ?d))

  ;; Set timeout to be instantaneous
  (setq avy-timeout-seconds 0)

  ;; Bindings for avy, hotkeyed in AHK
  (global-set-key (kbd "C-c C-1 j") 'avy-goto-char-timer)
  (global-set-key (kbd "C-c C-1 w") 'avy-goto-line)

  ;; Quick access shortcuts
  (defun jump-to-quick-todos ()
    "Jump to Quick TODOs in main.org"
    (interactive)
    (bookmark-jump "zz-quick-todos")
    )

  ;; Bindings for custom group
  (spacemacs/declare-prefix "o" "custom")

  ;; Jump to the "quick todos" section in the main org file
  (spacemacs/set-leader-keys "oq" 'jump-to-quick-todos)

  ;; Binding for helm-resume, to restore the previous helm minibuffer
  (spacemacs/set-leader-keys "or" 'helm-resume)

  ;; Binding for helm-resume, to restore the previous helm minibuffer
  (spacemacs/set-leader-keys "si" 'swiper)

  ;; Binding for narrow to visible window function
  (defun narrow-window ()
    (interactive)
    (narrow-to-region (window-start) (window-end))
    )
  (spacemacs/set-leader-keys "nn" 'narrow-window)

  ;; Disable themes before loading themes
  (defadvice load-theme (before theme-dont-propagate activate)
    "Disable theme before loading new one."
    (mapcar #'disable-theme custom-enabled-themes))

  ;; Switch between two themes
  (defun toggle-theme ()
    (interactive)
    (if (eq (car custom-enabled-themes) 'atom-one-dark)
        (progn (disable-theme 'atom-one-dark)
        (load-theme 'monochrome-bright))
      (if (eq (car custom-enabled-themes) 'monochrome-bright)
          (progn (disable-theme 'monochrome-bright)
           (load-theme 'atom-one-dark)))))

  ;; Toggle custom themes
  (spacemacs/set-leader-keys "ot" 'toggle-theme)

  ;; Open Ranger whenever a Dired buffer would be created.
  (ranger-override-dired-mode t)
  (setq ranger-show-hidden t)
  (setq shell-default-shell 'eshell)

  ;; Custom movement functions
  (defun mp-next-line-5 ()
    "Move cursor 5 lines down."
    (interactive)
    (evil-next-line 5)
    )
  (defun mp-previous-line-5 ()
    "Move cursor 5 lines down."
    (interactive)
    (evil-previous-line 5)
    )

  ;; Rebinding evil-repeat to double period (..) instead of single
  (define-key evil-normal-state-map (kbd ".") nil)
  (define-key evil-normal-state-map (kbd "..") 'evil-repeat)

  ;; Bindings for custom movement
  (define-key evil-motion-state-map (kbd "K") 'mp-previous-line-5)
  (define-key evil-motion-state-map (kbd "J") 'mp-next-line-5)
  (define-key evil-normal-state-map (kbd "K") nil)
  (define-key evil-normal-state-map (kbd "J") nil)
  (define-key evil-motion-state-map (kbd "gh") 'evil-first-non-blank)
  (define-key evil-motion-state-map (kbd "gl") 'evil-end-of-line)

  ;; Rebind evil-join previously bound to "J"
  (define-key evil-normal-state-map (kbd "gJ") 'evil-join)
  (define-key evil-normal-state-map (kbd "gK") 'evil-join-whitespace)

  ;; Not sure why the below doesn't work
  ;; (define-key evil-visual-state-map (kbd "K") 'mp-previous-line-5)
  ;; (define-key evil-visual-state-map (kbd "J") 'mp-next-line-5)

  ;; Insert new line below current line and move cursor to new line it will also
  ;; indent newline
  (define-key evil-motion-state-map (kbd "C-c <C-return>") (lambda (times)
                                      (interactive "p")
                                      (end-of-line)
                                      (newline times)))

  ;; Insert new line above current line and move cursor to previous line (newly
  ;; inserted line) it will also indent newline
  (define-key evil-motion-state-map (kbd "<C-return>") (lambda (times)
                                        (interactive "p")
                                        (beginning-of-line)
                                        (newline times)
                                        (previous-line)))

  ;; Rebind the keys above for org mode - previously taken by C-return
  (define-key evil-org-mode-map (kbd "<normal-state> <C-return>") nil)
  (define-key org-mode-map (kbd "<C-return>") nil)
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "ih" 'evil-org-org-insert-heading-respect-content-below)

  ;; Rebind Ranger movement keys J and K
  (define-key ranger-normal-mode-map (kbd "K") 'mp-previous-line-5)
  (define-key ranger-normal-mode-map (kbd "J") 'mp-next-line-5)

  ;; Rebind go to mark command to also recenter the cursor
  ;; evi-scroll-line-to-center has to be assigned nil in order to scroll to cursor
  (defun mp-goto-mark-and-center (char)
    "Move cursor to mark line and center."
    (interactive (list(read-char)))
    (evil-goto-mark char)
    (evil-scroll-line-to-center nil)
    )

  (defun mp-goto-mark-line-and-center (char)
    "Move cursor to mark line and center."
    (interactive (list(read-char)))
    (evil-goto-mark-line char)
    (evil-scroll-line-to-center nil)
    )

  (define-key evil-motion-state-map (kbd "`") 'mp-goto-mark-and-center)
  (define-key evil-motion-state-map (kbd "'") 'mp-goto-mark-line-and-center)

  ;; Rebind go to next/previous search result to also recenter the cursor
  (define-key evil-motion-state-map (kbd "n") (lambda (count)
                                                (interactive "p")
                                                (evil-ex-search-next count)
                                                (evil-scroll-line-to-center nil)))

  (define-key evil-motion-state-map (kbd "N") (lambda (count)
                                                (interactive "p")
                                                (evil-ex-search-previous count)
                                                (evil-scroll-line-to-center nil)))

  ;; Smooth scroll as opposed to instantaneous scrolling, do not confuse with smooth-scrolling
  (require 'smooth-scroll) ;; Smooth scroll
  (smooth-scroll-mode 1) ;; Enable it
  (setq smooth-scroll/vscroll-step-size 5) ;; Set the speed right

  ;; Custom capture templates
  (setq org-capture-templates
        (quote (
                ("a" "Quick Todo" item (file+olp "/mnt/c/users/nkgfr/shared/org/main.org" "Captured" "Quick TODOs")
                 "%?     [[%l][Link]]  %U" :prepend t)
                ("A" "Quick Todo with clipboard" item (file+olp "/mnt/c/users/nkgfr/shared/org/main.org" "Captured" "Quick TODOs")
                 "%?      %U\n%c " :prepend t)
                ("c" "Clipboard Entry" entry (file+olp "/mnt/c/users/nkgfr/shared/org/main.org" "Captured" "Unsorted")
                 "* %?\n\n%x\n%U" :prepend t :empty-lines 1)
                ("k" "Kill-ring Entry" entry (file+olp "/mnt/c/users/nkgfr/shared/org/main.org" "Captured" "Unsorted")
                 "* %?\n\n%c\n[[%l][Link]]  %U" :prepend t :empty-lines 1)
                ("l" "Link Entry" entry (file+olp "/mnt/c/users/nkgfr/shared/org/main.org" "Captured" "Unsorted")
                 "* %?\n\n%U  %a" :prepend t :empty-lines 1)
                ("s" "Simple Entry" entry (file+olp "/mnt/c/users/nkgfr/shared/org/main.org" "Captured" "Unsorted")
                 "* %?\n\n%U" :prepend t :empty-lines 1)
                ("C" "Clipboard TODO Entry" entry (file+olp "/mnt/c/users/nkgfr/shared/org/main.org" "Tasks" "Next Action")
                 "* TODO %?\n\n%x\n%U" :prepend t :empty-lines 1)
                ("K" "Kill-ring TODO Entry" entry (file+olp "/mnt/c/users/nkgfr/shared/org/main.org" "Tasks" "Next Action")
                 "* TODO %?\n\n%c\n[[%l][Link]]  %U" :prepend t :empty-lines 1)
                ("L" "Link TODO Entry" entry (file+olp "/mnt/c/users/nkgfr/shared/org/main.org" "Tasks" "Next Action")
                 "* TODO %?\n\n%U  %a" :prepend t :empty-lines 1)
                ("S" "Simple TODO Entry" entry (file+olp "/mnt/c/users/nkgfr/shared/org/main.org" "Tasks" "Next Action")
                 "* TODO %?\n\n%U" :prepend t :empty-lines 1)
                ;; ("z" "Trial" entry (file+olp "/mnt/c/users/nkgfr/shared/org/main.org" "Captured" "Unsorted")
                ;;  "* %?  [[%:link][%:description]]" :prepend t)
                )))

  ;; Required for the same motion in Org mode
  ;; There seems to be an issue with autoinitializing evil-org-mode so evil-org-mode-map
  ;; is undefined. The solution is to reload the .spacemacs file but these entries have
  ;; to be put at the end because nothing gets initialized after these line.
  (define-key evil-org-mode-map (kbd "<motion-state> g h") 'evil-first-non-blank)
  (define-key evil-org-mode-map (kbd "<motion-state> g l") 'evil-end-of-line)

  ;; Change self closing tags to end with an empty string instead of an "/"
  ;; Seems to have no effect
  (setq emmet-self-closing-tag-style "")

  ;; Rebinding magit status mode keys
  (define-key magit-mode-map (kbd "K") 'mp-previous-line-5)

  ;; Manually enable evil-goggles-mode
  (evil-goggles-mode)
  (setq evil-goggles-async-duration 0.25)
  (setq evil-goggles-blocking-duration 0.2)
  (setq evil-goggles-pulse nil)
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
;; custom-set-variables was added by Custom.
;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(global-nlinum-relative-mode t)

 '(package-selected-packages
   (quote
    (ranger nlinum-relative nlinum smeargle orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download magit-gitflow magit-popup htmlize helm-gitignore gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link evil-magit magit transient git-commit with-editor ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hydra lv hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile projectile pkg-info epl helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist highlight evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu elisp-slime-nav dumb-jump f dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#21252B" "#E06C75" "#98C379" "#E5C07B" "#61AFEF" "#C678DD" "#56B6C2" "#ABB2BF"])
 '(clean-aindent-mode t)
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(css-indent-offset 2)
 '(custom-safe-themes
   (quote
    ("cab317d0125d7aab145bc7ee03a1e16804d5abdfa2aa8738198ac30dc5f7b569" "669e02142a56f63861288cc585bee81643ded48a19e36bfdf02b66d745bcc626" default)))
 '(emmet-indentation 2)
 '(evil-auto-indent t)
 '(evil-want-Y-yank-to-eol t)
 '(fci-rule-color "#3E4451")
 '(git-gutter:added-sign "+")
 '(git-gutter:deleted-sign "-")
 '(git-gutter:modified-sign "!")
 '(global-hl-line-mode t)
 '(global-nlinum-relative-mode t)
 '(helm-display-header-line nil)
 '(hl-todo-keyword-faces
   (quote
    (("TODO" . "#dc752f")
     ("NEXT" . "#dc752f")
     ("THEM" . "#2d9574")
     ("PROG" . "#3a81c3")
     ("OKAY" . "#3a81c3")
     ("DONT" . "#f2241f")
     ("FAIL" . "#f2241f")
     ("DONE" . "#42ae2c")
     ("NOTE" . "#b1951d")
     ("KLUDGE" . "#b1951d")
     ("HACK" . "#b1951d")
     ("TEMP" . "#b1951d")
     ("FIXME" . "#dc752f")
     ("XXX+" . "#dc752f")
     ("\\?\\?\\?+" . "#dc752f"))))
 '(indent-tabs-mode nil)
 '(js-indent-level 2)
 '(magit-diff-use-overlays nil)
 '(org-agenda-files (quote ("c:/Users/nkgfr/Documents/main.org")))
 '(package-selected-packages
   (quote
    (git-gutter-fringe+ git-gutter+ ranger nlinum-relative nlinum smeargle orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download magit-gitflow magit-popup htmlize helm-gitignore gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link evil-magit magit transient git-commit with-editor ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hydra lv hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile projectile pkg-info epl helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist highlight evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu elisp-slime-nav dumb-jump f dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async)))
 '(paradox-github-token t)
 '(pdf-view-midnight-colors (quote ("#655370" . "#fbf8ef")))
 '(tab-always-indent (quote complete))
 '(tetris-x-colors
   [[229 192 123]
    [97 175 239]
    [209 154 102]
    [224 108 117]
    [152 195 121]
    [198 120 221]
    [86 182 194]])
 '(web-mode-css-indent-offset 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(avy-lead-face ((t (:background "gray75" :foreground "black"))))
 '(avy-lead-face-0 ((t (:background "gray85" :foreground "black"))))
 '(avy-lead-face-2 ((t (:background "gray95" :foreground "black"))))
 '(centaur-tabs-selected ((t (:foreground "white" :background "black" :weight bold :slant normal))))
 '(centaur-tabs-selected-modified ((t (:foreground "white" :background "black" :weight bold :slant italic))))
 '(centaur-tabs-unselected ((t (:foreground "white" :background "gray50" :weight normal :slant normal))))
 '(centaur-tabs-unselected-modified ((t (:foreground "white" :background "gray50" :weight normal :slant italic))))
 '(cursor ((t (:foreground "gray20"))))
 '(evil-ex-lazy-highlight ((t (:background "gray60" :foreground "black"))))
 '(evil-ex-search ((t (:background "gray40" :foreground "white"))))
 '(evil-ex-substitute-matches ((t (:background "gray50"))))
 '(evil-mc-cursor-default-face ((t (:foreground "white" :background "gray40"))))
 '(evil-snipe-first-match-face ((t (:background "gray40" :foreground "black"))))
 '(evil-snipe-matches-face ((t (:background "gray50" :foreground "white"))))
 '(font-lock-builtin-face ((t (:foreground "black" :slant italic))))
 '(font-lock-comment-face ((t (:slant italic :foreground "gray40" :family "courier new" :height 0.93))))
 '(font-lock-constant-face ((t (:foreground "black" :slant italic :weight normal))))
 '(font-lock-function-name-face ((t (:foreground "black" :slant italic :weight bold))))
 '(font-lock-keyword-face ((t (:foreground "black" :weight bold))))
 '(font-lock-string-face ((t (:foreground "gray50" :weight bold :slant italic))))
 '(font-lock-variable-name-face ((t (:foreground "black" :weight normal))))
 '(font-lock-warning-face ((t (:foreground "gray65" :underline t))))
 '(git-gutter-fr:added ((t (:weight bold :foreground "black"))))
 '(git-gutter-fr:deleted ((t (:weight bold :foreground "black" :background "#dc322f"))))
 '(git-gutter-fr:modified ((t (:weight bold :foreground "black" :background "#268bd2"))))
 '(git-gutter:added ((t (:weight bold :foreground "black"))))
 '(helm-selection ((t (:background "gray80"))))
 '(highlight ((t (:background "gray80" :foreground "black"))))
 '(iedit-occurrence ((t (:background "gray50" :foreground "white"))))
 '(js2-external-variable ((t (:foreground "gray40" :underline t))))
 '(js2-function-param ((t (:foreground "gray40" :weight bold))))
 '(js2-private-function-call ((t (:foreground "gray40"))))
 '(lsp-ui-sideline-code-action ((t (:slant italic :background "white" :foreground "gray45"))))
 '(lsp-ui-sideline-current-symbol ((t (:slant italic :foreground "gray45"))))
 '(lsp-ui-sideline-symbol ((t (:slant italic :foreground "gray45" :box (:line-width 1 :color "gray45" :style released-button)))))
 '(magit-branch-current ((t (:weight bold :foreground "black" :background "gray75" :box (:line-width 2 :color "black" :style released-button)))))
 '(magit-branch-local ((t (:slant italic :foreground "black" :box (:line-width 1 :color "black" :style released-button)))))
 '(magit-branch-remote-head ((t (:slant italic :foreground "black" :weight bold :box (:line-width 1 :color "black" :style released-button)))))
 '(magit-diff-added ((t (:foreground "black"))))
 '(magit-diff-added-highlight ((t (:background "gray85" :foreground "black"))))
 '(magit-diff-removed ((t (:weight bold :slant italic :foreground "gray45"))))
 '(magit-diff-removed-highlight ((t (:background "gray90" :weight bold :slant italic :foreground "gray45"))))
 '(magit-section-highlight ((t (:background "gray80"))))
 '(sp-show-pair-match-face ((t (:background "gray50"))))
 '(transient-argument ((t (:foreground "black" :underline (:color "black" :style line)))))
 '(transient-inactive-argument ((t (:foreground "gray65"))))
 '(web-mode-current-column-highlight-face ((t (:background "gray75"))))
 '(web-mode-current-element-highlight-face ((t (:foreground "white" :background "gray50"))))
 '(web-mode-doctype-face ((t (:foreground "black" :weight bold))))
 '(web-mode-folded-face ((t (:underline (:color "black" :style line) :background "gray85"))))
 '(web-mode-html-attr-name-face ((t (:foreground "black" :weight bold))))
 '(web-mode-html-tag-face ((t (:foreground "black" :weight bold)))))
)
