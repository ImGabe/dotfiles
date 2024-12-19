{ pkgs, ... }:

{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-gtk;

    extraPackages = epkgs: [
      epkgs.emms
      epkgs.magit
      epkgs.direnv
      epkgs.org
      epkgs.vertico

      epkgs.corfu

      epkgs.eglot
      epkgs.flymake

      epkgs.python
      epkgs.rust-mode
      epkgs.go-mode
      epkgs.nix-mode

      epkgs.editorconfig
    ];

    extraConfig = ''
      ;;; Personal configuration -*- lexical-binding: t -*-

      ;; Save the contents of this file under ~/.emacs.d/init.el
      ;; Do not forget to use Emacs' built-in help system:
      ;; Use C-h C-h to get an overview of all help commands.  All you
      ;; need to know about Emacs (what commands exist, what functions do,
      ;; what variables specify), the help system can provide.

      ;; Load a custom theme
      (load-theme 'adwaita t)

      ;; Set default font face
      (set-face-attribute 'default nil :font "JetBrainsMono Nerd Font Mono")

      ;; Disable the menu bar
      (menu-bar-mode -1)

      ;; Disable the tool bar
      (tool-bar-mode -1)

      ;; Disable the scroll bars
      (scroll-bar-mode -1)

      ;;; Completion framework
      (unless (package-installed-p 'vertico)
        (package-install 'vertico))

      ;; Enable completion by narrowing
      (vertico-mode t)

      ;; Improve directory navigation
      (with-eval-after-load 'vertico
        (define-key vertico-map (kbd "RET") #'vertico-directory-enter)
        (define-key vertico-map (kbd "DEL") #'vertico-directory-delete-word)
        (define-key vertico-map (kbd "M-d") #'vertico-directory-delete-char))

      ;;; Extended completion utilities
      (unless (package-installed-p 'consult)
        (package-install 'consult))
      (global-set-key [rebind switch-to-buffer] #'consult-buffer)

      ;; Enable line numbering in `prog-mode'
      (add-hook 'prog-mode-hook #'display-line-numbers-mode)

      ;; Automatically pair parentheses
      (electric-pair-mode t)

      ;;; LSP Support
      (unless (package-installed-p 'eglot)
        (package-install 'eglot))

      ;; Enable LSP support by default in programming buffers
      (add-hook 'prog-mode-hook #'eglot-ensure)

      ;; Create a memorable alias for `eglot-ensure'.
      (defalias 'start-lsp-server #'eglot)

      ;;; Inline static analysis

      ;; Enabled inline static analysis
      (add-hook 'prog-mode-hook #'flymake-mode)

      ;; Display messages when idle, without prompting
      (setq help-at-pt-display-when-idle t)

      ;; Message navigation bindings
      (with-eval-after-load 'flymake
        (define-key flymake-mode-map (kbd "C-c n") #'flymake-goto-next-error)
        (define-key flymake-mode-map (kbd "C-c p") #'flymake-goto-prev-error))

      ;;; Pop-up completion
      (unless (package-installed-p 'corfu)
        (package-install 'corfu))

      ;; Enable autocompletion by default in programming buffers
      (add-hook 'prog-mode-hook #'corfu-mode)

      ;;; Git client
      (unless (package-installed-p 'magit)
        (package-install 'magit))

      ;; Bind the `magit-status' command to a convenient key.
      (global-set-key (kbd "C-c g") #'magit-status)

      ;;; Indication of local VCS changes
      (unless (package-installed-p 'diff-hl)
        (package-install 'diff-hl))

      ;; Enable `diff-hl' support by default in programming buffers
      (add-hook 'prog-mode-hook #'diff-hl-mode)

      ;;; Go Support
      (unless (package-installed-p 'go-mode)
        (package-install 'go-mode))

      ;;; Haskell Support
      (unless (package-installed-p 'haskell-mode)
        (package-install 'haskell-mode))

      ;;; JSON Support
      (unless (package-installed-p 'json-mode)
        (package-install 'json-mode))

      ;;; Rust Support
      (unless (package-installed-p 'rust-mode)
        (package-install 'rust-mode))

      ;;; Nix Support
      ;;; (unless (package-installed-p 'nix-mode)
      ;;;  (package-install 'nix-mode))

      ;;; Typescript Support
      (unless (package-installed-p 'typescript-mode)
        (package-install 'typescript-mode))

      ;;; LaTeX support
      (unless (package-installed-p 'auctex)
        (package-install 'auctex))
      (setq TeX-auto-save t)
      (setq TeX-parse-self t)
      (setq-default TeX-master nil)

      ;; Enable LaTeX math support
      (add-hook 'LaTeX-mode-hook #'LaTeX-math-mode)

      ;; Enable reference mangment
      (add-hook 'LaTeX-mode-hook #'reftex-mode)

      ;;; Markdown support
      (unless (package-installed-p 'markdown-mode)
        (package-install 'markdown-mode))

      ;;; Outline-based notes management and organizer
      (global-set-key (kbd "C-c l") #'org-store-link)
      (global-set-key (kbd "C-c a") #'org-agenda)

      ;;; Additional Org-mode related functionality
      (unless (package-installed-p 'org-contrib)
        (package-install 'org-contrib))

      ;;; EditorConfig support
      (unless (package-installed-p 'editorconfig)
        (package-install 'editorconfig))

      ;; Enable EditorConfig
      (editorconfig-mode t)

      ;;; In-Emacs Terminal Emulation
      (unless (package-installed-p 'eat)
        (package-install 'eat))

      ;; Close the terminal buffer when the shell terminates.
      (setq eat-kill-buffer-on-exit t)

      ;; Enable mouse-support.
      (setq eat-enable-mouse t)

      ;;; Jump to arbitrary positions
      (unless (package-installed-p 'avy)
        (package-install 'avy))
      (global-set-key (kbd "C-c z") #'avy-goto-word-1)

      ;; Enable CUA key bindings
      (cua-mode t)

      ;; Miscellaneous options
      (setq-default major-mode
                    (lambda () ; guess major mode from file name
                      (unless buffer-file-name
                        (let ((buffer-file-name (buffer-name)))
                          (set-auto-mode)))))
      (setq confirm-kill-emacs #'yes-or-no-p)
      (setq window-resize-pixelwise t)
      (setq frame-resize-pixelwise t)
      (save-place-mode t)
      (savehist-mode t)
      (recentf-mode t)
      (defalias 'yes-or-no #'y-or-n-p)

      ;; Store automatic customisation options elsewhere
      (setq custom-file (locate-user-emacs-file "custom.el"))
      (when (file-exists-p custom-file)
        (load custom-file))
    '';
  };

}
