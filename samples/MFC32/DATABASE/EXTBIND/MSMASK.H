#ifndef __MSMASK_H__
#define __MSMASK_H__

// Machine generated IDispatch wrapper class(es) created by Microsoft Visual C++

// NOTE: Do not modify the contents of this file.  If this class is regenerated by
//  Microsoft Visual C++, your modifications will be overwritten.


/////////////////////////////////////////////////////////////////////////////
// CMsmask wrapper class

class CMsmask : public CWnd
{
protected:
	DECLARE_DYNCREATE(CMsmask)
public:
	CLSID const& GetClsid()
	{
		static CLSID const clsid
			= { 0xc932ba85, 0x4374, 0x101b, { 0xa5, 0x6c, 0x0, 0xaa, 0x0, 0x36, 0x68, 0xdc } };
		return clsid;
	}
	virtual BOOL Create(LPCTSTR lpszClassName,
		LPCTSTR lpszWindowName, DWORD dwStyle,
		const RECT& rect,
		CWnd* pParentWnd, UINT nID,
		CCreateContext* pContext = NULL)
	{ return CreateControl(GetClsid(), lpszWindowName, dwStyle, rect, pParentWnd, nID); }

    BOOL Create(LPCTSTR lpszWindowName, DWORD dwStyle,
		const RECT& rect, CWnd* pParentWnd, UINT nID,
		CFile* pPersist = NULL, BOOL bStorage = FALSE,
		BSTR bstrLicKey = NULL)
	{ return CreateControl(GetClsid(), lpszWindowName, dwStyle, rect, pParentWnd, nID,
		pPersist, bStorage, bstrLicKey); }

// Attributes
public:
	CString GetMask();
	void SetMask(LPCTSTR);
	long GetClipMode();
	void SetClipMode(long);
	BOOL GetPromptInclude();
	void SetPromptInclude(BOOL);
	BOOL GetAllowPrompt();
	void SetAllowPrompt(BOOL);
	BOOL GetAutoTab();
	void SetAutoTab(BOOL);
	BOOL GetFontBold();
	void SetFontBold(BOOL);
	BOOL GetFontItalic();
	void SetFontItalic(BOOL);
	CString GetFontName();
	void SetFontName(LPCTSTR);
	float GetFontSize();
	void SetFontSize(float);
	BOOL GetFontStrikethru();
	void SetFontStrikethru(BOOL);
	BOOL GetFontUnderline();
	void SetFontUnderline(BOOL);
	BOOL GetHideSelection();
	void SetHideSelection(BOOL);
	short GetMaxLength();
	void SetMaxLength(short);
	CString GetFormat();
	void SetFormat(LPCTSTR);
	CString GetFormattedText();
	void SetFormattedText(LPCTSTR);
	long GetSelLength();
	void SetSelLength(long);
	long GetSelStart();
	void SetSelStart(long);
	CString GetSelText();
	void SetSelText(LPCTSTR);
	CString GetClipText();
	void SetClipText(LPCTSTR);
	CString GetPromptChar();
	void SetPromptChar(LPCTSTR);
	OLE_COLOR GetBackColor();
	void SetBackColor(OLE_COLOR);
	LPFONTDISP GetFont();
	void SetFont(LPFONTDISP);
	OLE_COLOR GetForeColor();
	void SetForeColor(OLE_COLOR);
	CString GetText();
	void SetText(LPCTSTR);
	long GetMousePointer();
	void SetMousePointer(long);
	LPDISPATCH GetMouseIcon();
	void SetMouseIcon(LPDISPATCH);
	BOOL GetEnabled();
	void SetEnabled(BOOL);
	short GetBorderStyle();
	void SetBorderStyle(short);
	long GetAppearance();
	void SetAppearance(long);
	OLE_HANDLE GetHWnd();
	void SetHWnd(OLE_HANDLE);

// Operations
public:
	void AboutBox();
	void Refresh();
};

#endif // __MSMASK_H__
